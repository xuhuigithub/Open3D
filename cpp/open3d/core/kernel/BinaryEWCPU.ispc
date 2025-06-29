// ----------------------------------------------------------------------------
// -                        Open3D: www.open3d.org                            -
// ----------------------------------------------------------------------------
// Copyright (c) 2018-2024 www.open3d.org
// SPDX-License-Identifier: MIT
// ----------------------------------------------------------------------------

#include "open3d/core/Indexer.isph"
#include "open3d/core/ParallelFor.isph"

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUAddElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = *lhs + *rhs;                                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUSubElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = *lhs - *rhs;                                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUMulElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = *lhs * *rhs;                                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUDivElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = *lhs / *rhs;                                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

static inline void OPEN3D_SPECIALIZED(bool, CPUAddElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUSubElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUMulElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUDivElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalAndElement)(          \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)((bool)(*lhs) && (bool)(*rhs));                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalOrElement)(           \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)((bool)(*lhs) || (bool)(*rhs));                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalXorElement)(          \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)((bool)(*lhs) != (bool)(*rhs));                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalGtElement)(           \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(*lhs > *rhs);                                             \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalLtElement)(           \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(*lhs < *rhs);                                             \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalGeqElement)(          \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(*lhs >= *rhs);                                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalLeqElement)(          \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(*lhs <= *rhs);                                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalEqElement)(           \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(*lhs == *rhs);                                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalNeqElement)(          \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* lhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        const T* rhs =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(*lhs != *rhs);                                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalAndElement_bool)(      \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs) && (bool)(*rhs);                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalOrElement_bool)(       \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs) || (bool)(*rhs);                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalXorElement_bool)(      \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs) != (bool)(*rhs);                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalGtElement_bool)(       \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs > *rhs);                                           \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalLtElement_bool)(       \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (T)(*lhs < *rhs);                                              \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalGeqElement_bool)(      \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs >= *rhs);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalLeqElement_bool)(      \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs <= *rhs);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalEqElement_bool)(       \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs == *rhs);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalNeqElement_bool)(      \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* lhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        const T* rhs =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 1, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = (bool)(*lhs != *rhs);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUAddElementKernel,
                                  CPUAddElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUSubElementKernel,
                                  CPUSubElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUMulElementKernel,
                                  CPUMulElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUDivElementKernel,
                                  CPUDivElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalAndElementKernel,
                                  CPULogicalAndElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalOrElementKernel,
                                  CPULogicalOrElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalXorElementKernel,
                                  CPULogicalXorElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalGtElementKernel,
                                  CPULogicalGtElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalLtElementKernel,
                                  CPULogicalLtElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalGeqElementKernel,
                                  CPULogicalGeqElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalLeqElementKernel,
                                  CPULogicalLeqElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalEqElementKernel,
                                  CPULogicalEqElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalNeqElementKernel,
                                  CPULogicalNeqElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalAndElementKernel_bool,
                                  CPULogicalAndElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalOrElementKernel_bool,
                                  CPULogicalOrElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalXorElementKernel_bool,
                                  CPULogicalXorElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalGtElementKernel_bool,
                                  CPULogicalGtElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalLtElementKernel_bool,
                                  CPULogicalLtElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalGeqElementKernel_bool,
                                  CPULogicalGeqElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalLeqElementKernel_bool,
                                  CPULogicalLeqElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalEqElementKernel_bool,
                                  CPULogicalEqElement_bool,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalNeqElementKernel_bool,
                                  CPULogicalNeqElement_bool,
                                  uniform Indexer* uniform)
