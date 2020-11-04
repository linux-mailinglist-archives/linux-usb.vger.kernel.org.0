Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FBC2A6C2B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 18:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgKDRtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 12:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKDRtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 12:49:20 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DA0C0613D3
        for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2020 09:49:19 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id u4so5388206pgr.9
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2020 09:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6DcXk+MfzqX1VYgKu6yCxw6DUdWo+h55xJMrIphl6v0=;
        b=l8mgNMwn/m61nxiUfrS08uJ9lmAaaEF3bw3gbxTR+yd8gLCfNo8VkjWEUWal57/oav
         DU4e7/UZbPxEOpG0LmHYKfym9jzUPRQ3J4YUdcvMQ7GyLNn1NyHZAbmqMgTJHHvUBhwN
         DMp7Uzpho85QpnoNaJntK9tg17yEwmbDtyWeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6DcXk+MfzqX1VYgKu6yCxw6DUdWo+h55xJMrIphl6v0=;
        b=B5+g9ipeTZAz2eBQGVe135A3MKiiIlY3YBVenJnBDX6toHcWs9IYXVNZZL9v8bf4Jp
         phkIP/FeVOFjmqYa2NF1g6awea8Jk/0Xc3j3CQNyCG+bDaFA3Dn5t7FfQQ9TX8RKuhk9
         fuZUGmkkGRN2/WTJ3PGcrjmo1Ua7s1E9VaIbXRkglYn1TEr8W/U6zcgFgy5az+fN0rLx
         goxbJgdunGddtCfX/Y/zW67wZabKoWNVp5r6rdKf77XBhcWjHQ7/zH8OdK8bVGKyQ/5T
         4BGC85B+KKOxnClLAptdw4mcEp7CrL3vFWJm1k/rRQtZM4sFUeJA2xzeDY62zygdDbCJ
         d+xA==
X-Gm-Message-State: AOAM532vw11Wi3jp/dQLtrXSBlLln2qoxAJpiA/k1LL4Li2hCsPF2IiO
        b+s47PXK83Th3cRIbSkHD1J9nQ==
X-Google-Smtp-Source: ABdhPJx0dx/aveFsSHxCgcTEcAQc9HAgWMP5UBSvfwmC5gtlK5I5oG/MTu9LaA6X+XTTLVQGaUeetg==
X-Received: by 2002:a17:90b:3902:: with SMTP id ob2mr5437810pjb.109.1604512159187;
        Wed, 04 Nov 2020 09:49:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id d4sm2967693pjj.45.2020.11.04.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:49:18 -0800 (PST)
Date:   Wed, 4 Nov 2020 09:49:17 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 2/2] usb: typec: Expose Product Type VDOs via sysfs
Message-ID: <20201104174917.GC3913249@google.com>
References: <20201023214328.1262883-1-pmalani@chromium.org>
 <20201023214328.1262883-2-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023214328.1262883-2-pmalani@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

Was wondering if there were any comments on v3 of this series?

Best regards,

-Prashant
On Fri, Oct 23, 2020 at 02:43:28PM -0700, Prashant Malani wrote:
> A PD-capable device can return up to 3 Product Type VDOs as part of its
> DiscoverIdentity Response (USB PD Spec, Rev 3.0, Version 2.0, Section
> 6.4.4.3.1). Add sysfs attributes to expose these to userspace.
> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
