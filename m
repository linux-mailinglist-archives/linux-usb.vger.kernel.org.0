Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77303256F98
	for <lists+linux-usb@lfdr.de>; Sun, 30 Aug 2020 19:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgH3RxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Aug 2020 13:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgH3RxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Aug 2020 13:53:05 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F1BC061575
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2020 10:53:02 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 92so3259099qtb.6
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2020 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yH1J8hCQGCEZj5x88WC5CgJLue5izK8xcUhAdJYu3aA=;
        b=X9jDW+WqEr6Qd3xz4JS91mS4qm67XNj7+gQA1hLCr+ozEP3K6HAMzADL6YT177DB1G
         /uXyuMAfgt83xMKn/rq89+mSfzY6INhLIl6lcn7ZKAl7lPxVpA4eXz8WA0RU86VKw67o
         ww+X3E6VPh93mlAJGXCRhS7DA/pDcSthwfFU04SiCw2onUUgH5NtkjZ6RicWIrCtyLzH
         /Js8Tbm6nyA9zsLKOEbbGxfghiJF0RlQQrO5bKrbS5n02Q7etZMlSnjZzme0cC2tZ9bh
         gdcic7T+o+OecISpXqBh7G9HV5xVLKn/kI5Uw2phbDzc+XjVbFJURc5vYZ1QeYdupAGY
         fqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yH1J8hCQGCEZj5x88WC5CgJLue5izK8xcUhAdJYu3aA=;
        b=nNgXGKWAUNSYw6V/f1pmY+KDrEsESOvIMt9rGsP6PnKv76gdbNgzXgu0K3gi3aSwVT
         6vVC3Q7i6BAXcaF5fq1Mnhid5WP+hBMdjjq/VWyzTqc4YZKpaPfxmeKQV+lczO+lSvq4
         /ywod9HTedA0GCAx/hKr4qnVkPG2GPIQRL1yD4UT2I+aFdvrVUVYvRxOS3sr3OAKMACf
         RwRyPhMJ/wBKD6GKiAcDyUbZtquNVdyz25OdOJwZg74bIVdqeEGOb8IpiRP38dqXop1f
         S8SeZKwBBoAtisfgzJ/srEVwkBFuRIvvME1qUFdMtIiF0BZgwrac9ktEBu1348fxTJn7
         Hr/g==
X-Gm-Message-State: AOAM530EXXA9nyp2GouzgMamxCAWU4OUYYk8o/Zg2LH9nAPQaSLbAYkv
        s+xejPTGnnKq/x49tOChIBGheA==
X-Google-Smtp-Source: ABdhPJxlJuKK9dY0j5/s+p7Qz0nZTmqAnQO0yYzGoJC44cJ1LxMP6cZVfZIvfKOT/cENF+n/xibkEQ==
X-Received: by 2002:ac8:292a:: with SMTP id y39mr9431959qty.89.1598809979234;
        Sun, 30 Aug 2020 10:52:59 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id b199sm4988671qkg.116.2020.08.30.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 10:52:58 -0700 (PDT)
Date:   Sun, 30 Aug 2020 17:52:57 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>, sboyd@kernel.org,
        heikki.krogerus@linux.intel.com, agross@kernel.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
Message-ID: <20200830175257.GA1947@uller>
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-5-wcheng@codeaurora.org>
 <1ed0a34c-6219-fe3d-7d9c-13a74ce2d4d0@gmail.com>
 <02111c69-73fd-5e8c-5594-27393865d458@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02111c69-73fd-5e8c-5594-27393865d458@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu 20 Aug 07:47 UTC 2020, Wesley Cheng wrote:

> 
> 
> On 8/12/2020 2:34 AM, Sergei Shtylyov wrote:
> > Hello!
> > 
> > On 12.08.2020 10:19, Wesley Cheng wrote:
> > 
> >> Add the required DTS node for the USB VBUS output regulator, which is
> >> available on PM8150B.� This will provide the VBUS source to connected
> >> peripherals.
> >>
> >> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> >> ---
> >> � arch/arm64/boot/dts/qcom/pm8150b.dtsi�� | 6 ++++++
> >> � arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
> >> � 2 files changed, 10 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> >> b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> >> index 053c659734a7..9e560c1ca30d 100644
> >> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> >> @@ -53,6 +53,12 @@ power-on@800 {
> >> ������������� status = "disabled";
> >> ��������� };
> >> � +������� pm8150b_vbus: dcdc@1100 {
> > 
> > �� s/dcdc/regulator/? What is "dcdc", anyway?
> > �� The device nodes must have the generic names, according to the DT spec.
> > 
> 
> Hi Sergei,
> 
> Thanks for the comment!
> 
> DCDC is the label that we use for the DC to DC converter block, since
> the VBUS booster will output 5V to the connected devices.  Would it make
> more sense to have "dc-dc?"
> 

At this level it's just a regulator at 0x1100, so it should be
"regulator@1100". If you would like a more useful name in the running
system you should be able to use the "regulator-name" property.

Regards,
Bjorn

> Thanks
> Wesley
> 
> >> +����������� compatible = "qcom,pm8150b-vbus-reg";
> >> +����������� status = "disabled";
> >> +����������� reg = <0x1100>;
> >> +������� };
> >> +
> >> ��������� pm8150b_typec: typec@1500 {
> >> ������������� compatible = "qcom,pm8150b-usb-typec";
> >> ������������� status = "disabled";
> > [...]
> > 
> > MBR, Sergei
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
