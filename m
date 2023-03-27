Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED4B6C9F33
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 11:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbjC0JRo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 05:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjC0JRn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 05:17:43 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED6E4239
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 02:17:41 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so8066929pjl.4
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679908661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mIlFqMV9d89wi6csnHS/oc3l29TOANOLwnVmh6EklU=;
        b=m5lY8QxQZ0em7HwJf6c7V0l86IAttwNQyyrz33Gj9g1k695EpGA05fmdEXooiLdb9V
         r7mpONYjf+xdXc07BZjllghmFhDQN2YUi2X2WbA+dfW92OYxQKg4uu9KNCYkN9XLIX+i
         TxkWJKFR8taGG2jL3/VMcGhjbupRMyxt/nIMii4iQQZBxwwYgHrb0avPzZvaQSVFrGWz
         ++JH8qzyDuigY/E/S4SnhnqQkUcqRn3L3tSFURzIUDbMlKNsCbBP90ll7CbN8ek8GVYe
         TDfAY6AX+DayqKsF0DNdaswkD2Y0SBGpsV/uf+pLNmBc2VF8WqwIkEfd/3NXwmT22Pe+
         qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679908661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mIlFqMV9d89wi6csnHS/oc3l29TOANOLwnVmh6EklU=;
        b=Y/CCmjKDy8B0VBn+LqsvwAmqHpOKFS46wZU3uuIa7jDJGk1XJxzwDS1QfVqPBy0uDT
         ingCX9Btba9rtgdDEzOMTfAzB+UH54BlNot/aMi+fbkSeM5A/Q4J8QrlHjfe7SGGk2R+
         V3paCYLuYHXvYacLtgpYZaiGPbJWIpnsqG4c/zEDBlbrVWH+Kq7SBSWQuLDzWdIN2e+4
         cBKnj8weTPf9kqsL6HZOh2OIDFM6zgpv/8xm+g/8Pjw9ScPy4xob30+CW+IpEPajSYwh
         RGJYevLSKl3Fw1U84W8XIh7wCFEIdUgokEUpTiC9rvNGP3hCKtS+ICnVBaw5vI5v9CD9
         j/7Q==
X-Gm-Message-State: AAQBX9eoTVQ5MjfHaOEgXDwH7XkTTF/LNNgJCWuhR8bMuxxdn2LMDURz
        4KOw6H4o4nuP5RBW4vK3eFiX
X-Google-Smtp-Source: AKy350ZKV1z8I1+zYZBVU06068fGT+zSUq84NLAwH3mY5YDa0HpOY6nq35oIOGrwdWbz7qEnib0TmQ==
X-Received: by 2002:a17:90b:1c88:b0:234:28ac:ec4a with SMTP id oo8-20020a17090b1c8800b0023428acec4amr12338314pjb.2.1679908661023;
        Mon, 27 Mar 2023 02:17:41 -0700 (PDT)
Received: from thinkpad ([117.217.184.83])
        by smtp.gmail.com with ESMTPSA id nm13-20020a17090b19cd00b00231227781d5sm4053560pjb.2.2023.03.27.02.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 02:17:40 -0700 (PDT)
Date:   Mon, 27 Mar 2023 14:47:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] usb: dwc3: qcom: Allow runtime PM
Message-ID: <20230327091733.GA14584@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <cc7392c1-0ea1-29b3-fab6-19c843413724@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc7392c1-0ea1-29b3-fab6-19c843413724@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 27, 2023 at 11:01:35AM +0200, Konrad Dybcio wrote:
> 
> 
> On 25.03.2023 17:52, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series allows the dwc3-qcom driver to do runtime PM itself without
> > userspace intervention. Still, userspace is required to enable runtime PM
> > for dwc3 glue and xhci drivers as we cannot enable runtime PM for them.
> > But this series avoids one more additional step.
> What sort of 'userspace intervention' are we talking about?
> echo mem > /sys/power/state?
> 

I forgot to add that bit:

echo auto > /sys/devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.1.auto/power/control
echo auto > /sys/devices/platform/soc@0/a8f8800.usb/a800000.usb/power/control

You need to set "auto" for the runtime control for both xhci and dwc drivers.

Then if you don't connect a usb device, all 3 drivers (dwc3-qcom, dwc3, and
xhci) will become runtime suspended after a delay of 5s (default delay).

This can be confirmed by:

cat /sys/devices/platform/soc@0/a8f8800.usb/power/runtime_status

After connecting a usb device, they will all become "active".

Thanks,
Mani

> Konrad
> > 
> > While enabling runtime PM, I noticed that the xhci driver suspends before
> > catching the xhci interrupts during resume. This ended up deferring the
> > device enumeration for some time. So I included a patch adding autosuspend
> > delay of 200ms to the xhci driver. With this delay, usb enumeration happens
> > properly.
> > 
> > This series has been tested on SC8280XP-CRD and RB5 devices.
> > 
> > Thanks,
> > Mani
> > 
> > Manivannan Sadhasivam (5):
> >   arm64: dts: qcom: sc8280xp: Add missing dwc3 quirks
> >   xhci: host: Use 200ms autosuspend delay for runtime suspend
> >   usb: dwc3: qcom: Fix null ptr access during runtime_suspend()
> >   usb: dwc3: qcom: Clear pending interrupt before enabling wake
> >     interrupt
> >   usb: dwc3: qcom: Allow runtime PM
> > 
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
> >  drivers/usb/dwc3/dwc3-qcom.c           | 13 +++++++++----
> >  drivers/usb/host/xhci-plat.c           |  2 ++
> >  3 files changed, 25 insertions(+), 4 deletions(-)
> > 

-- 
மணிவண்ணன் சதாசிவம்
