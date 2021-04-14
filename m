Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48EB35F89B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 18:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347610AbhDNQCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 12:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348115AbhDNQCr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 12:02:47 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B263C061756
        for <linux-usb@vger.kernel.org>; Wed, 14 Apr 2021 09:02:23 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id r13so6714423pjf.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Apr 2021 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RsE15qj69GdBvW2DVWvJFA9TRsmasO/XLHkDcPhy07o=;
        b=Ki+WojfiYiNXB/RMwyGTmuDuJFnj4P/oVD+OauJzSv82srubsrewN2aNIZig/L28Le
         VzwCoEvFT7c1zmO0onceCg6fjbeBXfShM1rubslwbGYmIpcbDac2WjjwAWF+G6su/GVa
         KdbqP33gnvUoaWBxKDp+1e7BVrOCiysBpdwOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RsE15qj69GdBvW2DVWvJFA9TRsmasO/XLHkDcPhy07o=;
        b=N1RvFeDK/zsqF5wq7UZI3tgM8vFnmyIvZKV2t0m/xgN2x9FDAL/voOrn25mPGj0O8Z
         KjhIV6LKhiCXvqH3V6Xz1Cjz9v/ogTIUT2oZoTFe3f2JQibYOoWN3C4MVW5wo03nhM6H
         T6TVmu2OIDcZNO+jswLu314WHWOev7Yg2Y1yd44tmVlSUcFz6nzpgbs+mj79c3LqX5jD
         EuQX+/oEfETuDWamxhfCYN7e6KaVfW/n1i3oPkYF570yOlhMxLX8tkg325k5EixEDOdG
         SSe+majEpa4xa4lYSe0CC+xLRGWBGSNBZfOPU2egBgcwaKwJKwRPs2C3y3cCu/LUMhUd
         ZYWA==
X-Gm-Message-State: AOAM5300kNkGJIc/fX3YXtEJSyHauvQTUwKy8VLg2xNlQ/9sr5DQoazG
        5xoUnUR7W7RF5jHCPUUf5wewxg==
X-Google-Smtp-Source: ABdhPJylFxXgmjnnQWKfH5628N0zhGRv1f8NEXC9SgC/SVnR2nshtHWHR9JQpGcRw0niqZsZuHfxVQ==
X-Received: by 2002:a17:90b:438f:: with SMTP id in15mr4382158pjb.116.1618416143064;
        Wed, 14 Apr 2021 09:02:23 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:753e:814e:f002:498a])
        by smtp.gmail.com with ESMTPSA id h29sm42043pgb.3.2021.04.14.09.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 09:02:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
References: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v2] usb: dwc3: core: Add shutdown callback for dwc3
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Wed, 14 Apr 2021 09:02:21 -0700
Message-ID: <161841614106.46595.10678714020668948865@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2021-04-13 23:03:29)
> This patch adds a shutdown callback to USB DWC core driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
