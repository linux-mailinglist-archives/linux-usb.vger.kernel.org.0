Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC2C447458
	for <lists+linux-usb@lfdr.de>; Sun,  7 Nov 2021 18:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbhKGRQq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Nov 2021 12:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhKGRQp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Nov 2021 12:16:45 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D958C061570
        for <linux-usb@vger.kernel.org>; Sun,  7 Nov 2021 09:14:02 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 1so24890239ljv.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Nov 2021 09:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=QsFpuX4CZXjSXwybWdlWYBF+J7fzNHoYYgNPDK6Rsi4=;
        b=onrngZxn1bm4rkWgS4aWTACNZjYZtH/EST8EN5400QUQGccq04Q+Yy6eRHScaccNKC
         BKF8I9pQ9aXo79HqcUvcWIrH9m3/rtVw6BnixbS2GxrAzH1TKKUrb53O5FO0d13i9zlL
         vInH1HJJYrMBkDFC1vB+5v5/7G4n8I6oUITfrgjOAuEYrjTDGeYblbPVdBOYqQcJqFE7
         Ae6W9Bc2jElBehiyg9mML2wbiuYHWjtLS49WKm0srmIB1Mn0+mIwlIWuS4lXmtbiy5pu
         Yq7lsJx2SIbyZb3pTVWfUHkcHH5agZfBfeOELU55HV8pmhcyftMCRQkgifGuQTzo5l51
         sdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=QsFpuX4CZXjSXwybWdlWYBF+J7fzNHoYYgNPDK6Rsi4=;
        b=eIX51cZM2GIGUIB1CG+tqOyYc2MncMgqztvaXopzcAcE/qNQ13zUXfmqYa+dDQFTnq
         Dx+MFbDgviFCY+7fETfekAoaWLyJD75dNd54M6AEGYVkSyhuRBHVda5ywI9Ap5eea3vz
         HCfcmuawfvcWRIq1p3U26mqcodefk4u1mkXvNYXvpz3B6yeW7CczQdIKHio7ne+KV5gl
         pK1Uq8KV4KEaSsNCjtB1kkolcr9N+r3F92vTiQnJHF4T55/pcgTE0iPwonDE4tm7eKyQ
         fRPfzjeXUYwrnuEY+qeB5WMy76EejbXAfVEpjmBFI38iO9AwUmh9VIBFVfXtHCdNXBE3
         vcYQ==
X-Gm-Message-State: AOAM530fSkZIc1JL6DdIKjQTRv+o8pxzwQ3myfYAdyOca5ln5mhC6CB8
        0jer2TU9WNJjsy2pELMAQ66vExk2yEY=
X-Google-Smtp-Source: ABdhPJy1Crr3BQid5lurjqSyq644jZpbkrDQn/+ermGx6f0hM1GA3ckfEzyHS1TWKI71wgjBLWhzkQ==
X-Received: by 2002:a2e:9107:: with SMTP id m7mr6004865ljg.209.1636305239252;
        Sun, 07 Nov 2021 09:13:59 -0800 (PST)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id s17sm1694718lfe.10.2021.11.07.09.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:13:58 -0800 (PST)
Date:   Sun, 7 Nov 2021 18:13:56 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/4] tools/usbip: Patch set summary
Message-ID: <20211107171356.GA14331@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To forward a remote usb device over usbip the following steps is required:

1. Execute "usbip bind" on remote end.
2. Execute "usbip attach" on local end.

These steps must be perfomed in above order and after usb device is plugged in.
If the usb device is unplugged on the remote end the steps above needs to be
performed again to establish the connection. This patch set implements a feature
to persistently forward devices on a given bus. When using flag "-p|--persistent"
on remot end, the USB device becomes exported when plugged in. When using flag
"-p|--persistent" on local end, the USB device becomes imported when available
on remote end. Thus it is only required to run the usbip command once on each
end, in any order, to persistently forward usb devices on a given bus.

This is sent in four separate patches:
  tools/usbip: update documentation
  tools/usbip: add usb event monitor into libusbip
  tools/usbip: export USB devices on a given bus persistently
  tools/usbip: import USB devices on a given bus persistently
