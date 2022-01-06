Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EAD486A49
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 20:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243156AbiAFTGN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 14:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243137AbiAFTGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 14:06:12 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D32EC061201
        for <linux-usb@vger.kernel.org>; Thu,  6 Jan 2022 11:06:12 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id r14-20020a17090b050e00b001b3548a4250so1224100pjz.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Jan 2022 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Zsjxxw6pd4DdvZ9ARrFvDZnuIXFpfJxLz7WO0wCernQ=;
        b=aPDN54U5pkO5HHNN6o/d+Wa46jM8wSiiODG4x4hx33hrw4OfsqihQg6zGV32Nj2zax
         JanNwsFLN7TQup4lMAwYXzxS84trjw6x7/2pIIngpus6+Hssuuj1jxFjOt1qcbui6bpZ
         6AmUuehvcx4mr6QOG8ewp7Cb1IlOODwTu/hDVjZ4VR9tvO5+MY+aNXQ0Fo730QUdACHZ
         Yow2dzJLGzg4AcMPAWd4xVEUGzJVD6GxhcxA90amuZ5C5hseVYIVuBRtwS00ZZe/bpWb
         lAY4zAiuU3op47BJHysCARxVDHEyM4Xy+uuTB+N6Qiz2ZVnKNLkTCZe7ks1VM2zVWO8x
         D8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Zsjxxw6pd4DdvZ9ARrFvDZnuIXFpfJxLz7WO0wCernQ=;
        b=NHXE3pfH3Kf7jM1QzSV84njObsNMsgnTYrhGrGesNVV3+ldx2BH6Db3YHEUwy3uujc
         iSk7CbPRQluzbIPPLpVhrshuIZXBlOSxq3nfhm1Y5gQ74YYu35AGIzkrhPyupkoBfrmr
         uTIKknD3i865SRaiJN+hDsG9DnFvGC+O2D1SviwZXon68MC0AjLTQgNwnirrImCMPdYK
         w/v/E3V6uwF9Fm5So0FkBlRa3RktoVzg81/WTCeC59srXY8cClUIPWnlgFnKYFlb5aKq
         E/rDZbccBvX1s9vuXpMGgkcc0yCac+wqlh/pgqxwwInXW2vS4L4QkJ7PXZrK1sz2s4Sm
         wV/A==
X-Gm-Message-State: AOAM532RR0YrXKYf+GsOdI+wKH8ecHyNkeN1ywiyTrcDFLkJ0daJ7ngN
        kHi38XBiUAnzHAv8bwDxWUCDeA==
X-Google-Smtp-Source: ABdhPJyxOxZKTJqgzSxRXlJWQk0gUdFo548NlJxlwKKYwpOb8FAbfo+BhY8W4Pz7mnZZ/bRCO95gCA==
X-Received: by 2002:a17:903:24d:b0:149:b68f:579 with SMTP id j13-20020a170903024d00b00149b68f0579mr24075313plh.1.1641495971463;
        Thu, 06 Jan 2022 11:06:11 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z18sm3468833pfe.146.2022.01.06.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 11:06:10 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 0/3] usb: meson: fix shared reset control use
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
Date:   Thu, 06 Jan 2022 11:06:10 -0800
Message-ID: <7hv8ywr8f1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Amjad,

Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:

> This patchset fixes a usb suspend warning seen on the libretech-cc by
> using reset_control_rearm() call of the reset framework API. 
> This call allows a reset consummer to release the reset line even when 
> just triggered so that it may be triggered again by other reset
> consummers.
>
> reset_control_(de)assert() calls are called, in some meson usb drivers, 
> on a shared reset line when reset_control_reset has been used. This is not
> allowed by the reset framework.
>
> Finally the meson usb drivers are updated to use this new call, which
> solves the suspend issue addressed by the previous reverted 
> commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
> use").
>
> changes since v4:
> - call reset_control_rearm() after clk_prepare_enable() fails
>
> Amjad Ouled-Ameur (3):
>   phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
>   phy: amlogic: meson8b-usb2: Use dev_err_probe()
>   phy: amlogic: meson8b-usb2: fix shared reset control use
>
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
>  drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)

The cover letter prefix is "usb: meson" but all the patches are for
drivers/phy.

Could you collect the reviewed-by etc tags and resend to the PHY
maintainers and linux-phy list?

Thanks,

Kevin


