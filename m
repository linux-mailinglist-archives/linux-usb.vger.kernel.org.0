Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F0C705F71
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 07:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjEQFiu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 01:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjEQFip (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 01:38:45 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6480B19B9
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 22:38:44 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64ab2a37812so10566147b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 22:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684301924; x=1686893924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhm48+K5HjHXU3+QzS1kL3X1HshR4Fvk/HtPmy8eeWs=;
        b=ozff3e9E4AIzUUehV/L8OAyJYoa7YLbT+iHcw9QEX1ZroKqL7cubwjWStHA2tjsOvp
         YVxQy1Ja+A8SyJ9W9AzQD8i/6wTZ0visaGfRUyc80T5bT8VBLDsz6KnIP6zsyU2pU3kZ
         Ynt20YmCcaw30x/dJOuFzkMZZO/sSabi8LQJ+3NsaOM1dw7kXYXIsxMqwZ9lAKKeU8E1
         LYrOFNsG+AQU7ko0uPSDi99Z+dxWDiDbggogtHGVGCcCHJBCxdTNz0b2TBEIiG+CkJmk
         +tV8vrEHTvISlg++tW3goTtNcD8l1U/SeFHGzWUG7L04uT8DRgv6aypOTHZRBRczl9+d
         GO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684301924; x=1686893924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhm48+K5HjHXU3+QzS1kL3X1HshR4Fvk/HtPmy8eeWs=;
        b=mFwX620MPb7l3PZsQ3eCFSfuJOcrWADh89V5lHQDZ+0c2MpDVzpa8gTezpIdPH0Z6e
         polEhCniCv3MU4V5vgM3o2m0PN5/tunXr9XnwGUmVx0FN/AkYtQqtO5k32Ywq3sfLM+s
         mxyz/J7GkJJ8QPzeZYGp7qQg0ZmM9iy/c1CbkVYgC87CN10e9i0KLuot5trs03HWF645
         0/03OQEglVRcpZw45ihbu5DZP9ZXvF2QXaoToFSMuZCT4w1SDljh/nu6If3q1p6WY4ju
         HESwXVx7CJRvmQGRoaoANAtPHD0TZ5cKKdcPBkFX1j+DPJbwhWOKUmM63lN2JdARK55Z
         tTiA==
X-Gm-Message-State: AC+VfDxBQ7I9Z/K+fcQGhtzw58ONZw9V7vGJ7nTFSDLExsJ83DaqDFkJ
        bJqxi+trV/fLU0meAmlgpLH4kaVGVilIkm9EWw==
X-Google-Smtp-Source: ACHHUZ7r3oS+FJvlINXRzAwQKo//Tpb7ztgszN4YqVpz+iHPSZaJbsVyYwPN775jZX2HUiZx5uh+Pw==
X-Received: by 2002:a17:902:f683:b0:1ac:731b:bc9a with SMTP id l3-20020a170902f68300b001ac731bbc9amr1430551plg.27.1684301923768;
        Tue, 16 May 2023 22:38:43 -0700 (PDT)
Received: from thinkpad ([59.92.102.59])
        by smtp.gmail.com with ESMTPSA id x18-20020a17090300d200b001a95f632340sm16560589plc.46.2023.05.16.22.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 22:38:43 -0700 (PDT)
Date:   Wed, 17 May 2023 11:08:38 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v5 1/5] usb: misc: eud: Fix eud sysfs path (use
 'qcom_eud')
Message-ID: <20230517053838.GF4868@thinkpad>
References: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
 <20230516213308.2432018-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516213308.2432018-2-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 17, 2023 at 03:03:04AM +0530, Bhupesh Sharma wrote:
> The eud sysfs enablement path is currently mentioned in the
> Documentation as:
>   /sys/bus/platform/drivers/eud/.../enable
> 
> Instead it should be:
>   /sys/bus/platform/drivers/qcom_eud/.../enable
> 
> Fix the same.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

I believe the path has changed during one of the EUD patch iterations. In that
case, the documentation is wrong from day one. So this patch should have the
relevant Fixes tag.

With that,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/ABI/testing/sysfs-driver-eud | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> index 83f3872182a4..2bab0db2d2f0 100644
> --- a/Documentation/ABI/testing/sysfs-driver-eud
> +++ b/Documentation/ABI/testing/sysfs-driver-eud
> @@ -1,4 +1,4 @@
> -What:		/sys/bus/platform/drivers/eud/.../enable
> +What:		/sys/bus/platform/drivers/qcom_eud/.../enable
>  Date:           February 2022
>  Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>  Description:
> -- 
> 2.38.1
> 

-- 
மணிவண்ணன் சதாசிவம்
