Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F4C46C3C9
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 20:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhLGTo7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 14:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236311AbhLGTo6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 14:44:58 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE06C061748
        for <linux-usb@vger.kernel.org>; Tue,  7 Dec 2021 11:41:27 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so263986otg.4
        for <linux-usb@vger.kernel.org>; Tue, 07 Dec 2021 11:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=L3MI+h0u5a63sfoKLcmo7CVjt1c80jtugNXNjUS8/Jk=;
        b=d7Ya5eg8tOISCP0Ft13/S/sAUgMZ0KecWxiuHO43ptpK5siTHkYek/rSLNzRgz6/g/
         URILtPjeVdASN+HVq+GmUwIcfNNyLHHW6oQmFbFf31z12fibKMkBrFeh/zceaib9GEAv
         ejs5691m4x1KZV8lN/7mfGn3gPhSJcQyrP/u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=L3MI+h0u5a63sfoKLcmo7CVjt1c80jtugNXNjUS8/Jk=;
        b=PDwJrs5JEogiAWgTAPU+kabYMSx5t7X2BYOsHm9X8ONLgaoa95Se3BLkFD6SJLOpDK
         VoxNNt4oVRRXXRJtBuLWXge0W9W/8JheLTbBZARp8hBbv1BdT2EAMy+CnDsVvyz0x8Rs
         ovc68wAxRE0S9mha7TMAKQpxw52yOgOw2u6LkEuGaF3u3/f9HO/juyhvEKX8bU7KGjBu
         TCV3X7Rh/W0mOZgfHSeIFaU4R7ng2i/dH7bYmQoBJvA7VqVKA9JM9n+ZO3z7dudmAUg3
         +kkcT9hgs6i0JGb+2RTW+EURBz8I/0rKyNK5mWi3pwJ7LMiaWS6h5ZHmBCTj5HSQSXrO
         0eNQ==
X-Gm-Message-State: AOAM533tY3iDEBgRB3zaviCJ0YUjQxgyrc95DqOpnjlH1ogpkzdbjCIA
        CIja+J+tD/uJhT8+O9KPy2LcFwTlueyRBYwlq2EFSg==
X-Google-Smtp-Source: ABdhPJyWKZOZt61oBDBtwA1NmPAv5zfH9arDEDUBhs1KDK1dQBrwuJLt/m0bk+oDxA4rWbR6/PyO+Tok5lhmUB0tq04=
X-Received: by 2002:a05:6830:30b7:: with SMTP id g23mr36355972ots.159.1638906087317;
 Tue, 07 Dec 2021 11:41:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Dec 2021 14:41:26 -0500
MIME-Version: 1.0
In-Reply-To: <20211207094327.1.Ie3cde3443039342e2963262a4c3ac36dc2c08b30@changeid>
References: <20211207094327.1.Ie3cde3443039342e2963262a4c3ac36dc2c08b30@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Dec 2021 14:41:26 -0500
Message-ID: <CAE-0n53UzgtKop5KmkxvBRroO-zFHDUgmWU3di1=Xomtew2NJg@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
 property by default"
To:     Douglas Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Douglas Anderson (2021-12-07 09:43:41)
> This reverts commit cefdd52fa0455c0555c30927386ee466a108b060.
>
> On sc7180-trogdor class devices with 'fw_devlink=permissive' and KASAN
> enabled, you'll see a Use-After-Free reported at bootup.
>
> The root of the problem is that dwc3_qcom_of_register_core() is adding
> a devm-allocated "tx-fifo-resize" property to its device tree node
> using of_add_property().
>
> The issue is that of_add_property() makes a _permanent_ addition to
> the device tree that lasts until reboot. That means allocating memory
> for the property using "devm" managed memory is a terrible idea since
> that memory will be freed upon probe deferral or device unbinding.
>
> Let's revert the patch since the system is still functional without
> it. The fact that of_add_property() makes a permanent change is extra
> fodder for those folks who were aruging that the device tree isn't
> really the right way to pass information between parts of the
> driver. It is an exercise left to the reader to submit a patch
> re-adding the new feature in a way that makes everyone happier.
>
> Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
