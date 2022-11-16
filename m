Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C1E62B581
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 09:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbiKPIsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 03:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbiKPIsC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 03:48:02 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF7E1AF3C
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 00:47:59 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id g26so7886142vkm.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 00:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uYCvssQsxQyryDqf1tPUFmRDfpsreHuLMV/WL4ug3xw=;
        b=KFKTNh5yNJjTsIW0ivcfbd6zzT/EtDfGlQEqtZdRWnfYKW4zzesLNO3jOhj8PDwuZB
         /77LdbFscoegmgsvY1ipEGnSkJKIpatYJGU285kI8Ap6D8JO/9Q0w6T5aLiVDa4wd4IZ
         jpZhQ7OXabuuYIzn4k8ViVbe9K9Y147cZTd1Pp1PzybdMCIFhlTbcoAePSykK++uFGPE
         3Enheudhi7953nJP1W3+EqlbuD7UNcPtv6Md5iFxZL2K20CY5xhC85WANm6cKaPDcSQF
         aWixzPj3b+VfinQ7Lw13gWuWw1ftSk0mCswC8Gh8QpNJu8EXDw/X3XCy+YPdfGEQOBdN
         J+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYCvssQsxQyryDqf1tPUFmRDfpsreHuLMV/WL4ug3xw=;
        b=UvrJt9uH39l50/1le5J2yLHFV1HO62tGKMcfzAYHQXYreyIQ0gcACcHjPU7WFKvUC+
         tinqs9O68wqgWfxK3q9moiBuqR1kBVb8A5EJE07TjB3BVP7C7Rnd+GmW6ZPnXUZ5MroN
         /nd+2FZ6E5TyemQU6k8ga1rg7yTFtqRfhdFo6abDaF09VCqnwW009Ss72eWf7PYvxv0Y
         auJQZ0rjWdLqz94Plv+3NAA4exjeKOtN2Y6oZCazt8jGBFpZ776N3f8KeQYB6s33SkUo
         +pxO2sybHjgVqRDY2N60tbrchjtSeZVgxA1KY/on/b/c0/etjdm6e6Jtl6J2IZhSjWyY
         /65w==
X-Gm-Message-State: ANoB5pnoRuC34LVIPyVe53JY2SDYllqSiQ0yul4DF0gKEoYxhroVPEXL
        bGDOtcJrPc4vCyo3jlVG3tTO9ySKh5TyRUr8384=
X-Google-Smtp-Source: AA0mqf4P4XJXVrPXh2UlSGHGYj5Vqtuet8hnUVaUu0aCTR3u6ynrGfmMOR2GXCyuZ01YnlnAI9FZRK4i73iGa3IGjmw=
X-Received: by 2002:a1f:ab81:0:b0:3b6:1aa6:49b4 with SMTP id
 u123-20020a1fab81000000b003b61aa649b4mr12089967vke.18.1668588479047; Wed, 16
 Nov 2022 00:47:59 -0800 (PST)
MIME-Version: 1.0
From:   chao zeng <chao.zengup@gmail.com>
Date:   Wed, 16 Nov 2022 16:46:51 +0800
Message-ID: <CAGzEXPYzhJdw5M+F0SdcrtN8Hnew_LCjD6bC=ANBJzBxVRM_NA@mail.gmail.com>
Subject: Some problems about xhci_ring_expansion
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

hello!
  Thank you for taking the time to look at my question.

  At file xhci-ring.c
static inline int room_on_ring(struct xhci_hcd *xhci, struct xhci_ring *ring,
                unsigned int num_trbs)
{
        int num_trbs_in_deq_seg;

        if (ring->num_trbs_free < num_trbs)
                return 0;

        if (ring->type != TYPE_COMMAND && ring->type != TYPE_EVENT) {
                num_trbs_in_deq_seg = ring->dequeue - ring->deq_seg->trbs;
                if (ring->num_trbs_free < num_trbs + num_trbs_in_deq_seg)
                        return 0;////suppose return here
        }

        return 1;
}

Suppose the function room_on_ring returns in my bolded condition.
num_trbs_needed will be a very large value because the num_trbs <
num_trbs_free. In this way , we will just double the total ring size.
Is this as expected or should add one segment size instead?
                num_trbs_needed = num_trbs - ep_ring->num_trbs_free;//
unsigned int num_trbs_needed will be very large value
                if (xhci_ring_expansion(xhci, ep_ring, num_trbs_needed,
                                        mem_flags)) {
                        xhci_err(xhci, "Ring expansion failed\n");
                        return -ENOMEM;
                }



BR
Chao.Zeng
