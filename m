Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0622A61AC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 11:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgKDKd4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 05:33:56 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45266 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbgKDKdy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 05:33:54 -0500
Received: by mail-lf1-f67.google.com with SMTP id y184so24500760lfa.12
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2020 02:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XHNzyUaPh6luKS4eg7geZ9+7qFoTphEVdpP32ZJQLWE=;
        b=VP+X4zIZtkxd3zysr1pX/GZTDHOTjwSAR7n1QmvJHffFu3BdN+p2VuDT7dfZRqw1jA
         FLmZ0KR7E8HWSe80vb+CFFdIX55y6sUatw2+raeDstGr7XGsC0Ozf0ZQskxehtOJAD9c
         S1YfzMx4JlxAiho+31K/Icdr6Tbgn2seSyeEizNpq+3cTcKL/9TomoEFu1Mw0bK0ZTr4
         s9uvIgeRrmlXOW+ieQ6jreZJvS8kaJa8715hdhyLy5vSm37sJUOeDkXCWX8clvpopQWO
         oRZejAoBs671PkVQmgyShBAAITUsx6xKPSOFGeaHEs/JIKFl2akyNX2TDxwPNjA2ge6R
         dCsQ==
X-Gm-Message-State: AOAM5325+HqdcKWqnpmGGrz8Kmb5Ih+ZCHc41SOjmOtuOnL4b/9BwSSP
        qQfv4PLja7gf8DMcbVKeWxs=
X-Google-Smtp-Source: ABdhPJzHj+BAJ4MRGU/WoiUliBhLbqqgYuk7AP1CzcX5wb86U1Pmyw4bbbVBwNUMAmAE7OonE80tAA==
X-Received: by 2002:a05:6512:3102:: with SMTP id n2mr9010584lfb.153.1604486032950;
        Wed, 04 Nov 2020 02:33:52 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p14sm362397lfa.244.2020.11.04.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 02:33:52 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kaG72-0002nL-6D; Wed, 04 Nov 2020 11:33:56 +0100
Date:   Wed, 4 Nov 2020 11:33:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add LE910Cx compositions
 0x1203, 0x1230, 0x1231
Message-ID: <20201104103356.GT4085@localhost>
References: <20201031225458.10512-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031225458.10512-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 31, 2020 at 11:54:58PM +0100, Daniele Palmas wrote:
> Add following Telit LE910Cx compositions:
> 
> 0x1203: rndis, tty, adb, tty, tty, tty, tty
> 0x1230: tty, adb, rmnet, audio, tty, tty, tty, tty
> 0x1231: rndis, tty, adb, audio, tty, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Hi Johan,
> 
> following lsusb verbose output for the compositions:

Thanks, now applied after adding a stable tag and comments after the
entries (e.g "Telit LE910Cx (RNDIS)").

Johan
