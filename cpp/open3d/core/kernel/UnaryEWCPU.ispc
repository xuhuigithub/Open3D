// ----------------------------------------------------------------------------
// -                        Open3D: www.open3d.org                            -
// ----------------------------------------------------------------------------
// Copyright (c) 2018-2024 www.open3d.org
// SPDX-License-Identifier: MIT
// ----------------------------------------------------------------------------

#include "open3d/core/Indexer.isph"
#include "open3d/core/ParallelFor.isph"

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUSqrtElement)(                \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = sqrt(*src);                                                   \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_FLOAT_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUSinElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = sin(*src);                                                    \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_FLOAT_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUCosElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = cos(*src);                                                    \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_FLOAT_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUNegElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = -*src;                                                        \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUExpElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = exp(*src);                                                    \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_FLOAT_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUAbsElement)(                 \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = abs((double)*src);                                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUFloorElement)(               \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = floor((double)*src);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUCeilElement)(                \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = ceil((double)*src);                                           \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPURoundElement)(               \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = round((double)*src);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUTruncElement)(               \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = trunc((double)*src);                                          \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPUIsNanElement)(                \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* src =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = isnan((float)*src);                                            \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE

// isinf() is not defined in ISPC.
/*
#define TEMPLATE(T)                                                    \
    static inline void OPEN3D_SPECIALIZED(T, CPUIsInfElement)(         \
            int64_t idx, uniform Indexer * uniform indexer) {          \
        const T* src = OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0,
idx); \
        bool* dst = OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer,
idx);         \
        *dst = isinf((float)*src);                                     \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE
*/

// isfinite() is not defined in ISPC.
/*
#define TEMPLATE(T)                                                    \
    static inline void OPEN3D_SPECIALIZED(T, CPUIsFiniteElement)(      \
            int64_t idx, uniform Indexer * uniform indexer) {          \
        const T* src = OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0,
idx); \
        bool* dst = OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer,
idx);         \
        *dst = isfinite((float)*src);                                  \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE()
#undef TEMPLATE
*/

#define TEMPLATE(T)                                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalNotElement)(          \
            int64_t idx, uniform Indexer* uniform indexer) {                 \
        const T* src =                                                       \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx); \
        T* dst = OPEN3D_SPECIALIZED(T, Indexer_GetOutputPtr)(indexer, idx);  \
        *dst = (T)(!(bool)(*src));                                           \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPULogicalNotElement_bool)(      \
            int64_t idx, uniform Indexer* uniform indexer) {                  \
        const T* src =                                                        \
                OPEN3D_SPECIALIZED(T, Indexer_GetInputPtr)(indexer, 0, idx);  \
        bool* dst =                                                           \
                OPEN3D_SPECIALIZED(bool, Indexer_GetOutputPtr)(indexer, idx); \
        *dst = !(bool)(*src);                                                 \
    }
#pragma ignore warning(perf)
OPEN3D_INSTANTIATE_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                           \
    static inline void OPEN3D_SPECIALIZED(T, CPUSqrtElement)( \
            int64_t idx, uniform Indexer* uniform indexer) {  \
        /* No-op */                                           \
    }
OPEN3D_INSTANTIATE_INTEGER_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUSinElement)( \
            int64_t idx, uniform Indexer* uniform indexer) { \
        /* No-op */                                          \
    }
OPEN3D_INSTANTIATE_INTEGER_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

#define TEMPLATE(T)                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUCosElement)( \
            int64_t idx, uniform Indexer* uniform indexer) { \
        /* No-op */                                          \
    }
OPEN3D_INSTANTIATE_INTEGER_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

static inline void OPEN3D_SPECIALIZED(bool, CPUNegElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

#define TEMPLATE(T)                                          \
    static inline void OPEN3D_SPECIALIZED(T, CPUExpElement)( \
            int64_t idx, uniform Indexer* uniform indexer) { \
        /* No-op */                                          \
    }
OPEN3D_INSTANTIATE_INTEGER_TEMPLATE_WITH_BOOL()
#undef TEMPLATE

static inline void OPEN3D_SPECIALIZED(bool, CPUAbsElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUFloorElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUCeilElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPURoundElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUTruncElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUIsNanElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUIsInfElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

static inline void OPEN3D_SPECIALIZED(bool, CPUIsFiniteElement)(
        int64_t idx, uniform Indexer* uniform indexer) {
    /* No-op */
}

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUSqrtElementKernel,
                                  CPUSqrtElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUSinElementKernel,
                                  CPUSinElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUCosElementKernel,
                                  CPUCosElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUNegElementKernel,
                                  CPUNegElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUExpElementKernel,
                                  CPUExpElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUAbsElementKernel,
                                  CPUAbsElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUFloorElementKernel,
                                  CPUFloorElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUCeilElementKernel,
                                  CPUCeilElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPURoundElementKernel,
                                  CPURoundElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUTruncElementKernel,
                                  CPUTruncElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUIsNanElementKernel,
                                  CPUIsNanElement,
                                  uniform Indexer* uniform)

// isinf() is not defined in ISPC.
/*
OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUIsInfElementKernel,
                                  CPUIsInfElement,
                                  uniform Indexer* uniform)
*/

// isfinite() is not defined in ISPC.
/*
OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPUIsFiniteElementKernel,
                                  CPUIsFiniteElement,
                                  uniform Indexer* uniform)
*/

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalNotElementKernel,
                                  CPULogicalNotElement,
                                  uniform Indexer* uniform)

OPEN3D_EXPORT_TEMPLATE_VECTORIZED(CPULogicalNotElementKernel_bool,
                                  CPULogicalNotElement_bool,
                                  uniform Indexer* uniform)
