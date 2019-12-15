Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B15211FACA
	for <lists+linux-usb@lfdr.de>; Sun, 15 Dec 2019 20:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfLOTcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Dec 2019 14:32:12 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41308 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLOTcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Dec 2019 14:32:11 -0500
Received: by mail-pf1-f196.google.com with SMTP id s18so4396175pfd.8
        for <linux-usb@vger.kernel.org>; Sun, 15 Dec 2019 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=SD6710XuCGfLCRjEaTIYpMnkGtQ6zZzJk7TYgaQ/Siw=;
        b=xJxXeatCAJCU30I9wwZmedY0avOrIT77KoTok0JQ/JbFO9lmaK+0DfZ89kJwB0PnQH
         vuqLgph7k+ofwTsPyEL9u2khQekl5nD5+qrkeNIqdcOguBAfTjcQsMOuQ3Gq4fdzpp50
         2uwVakow0BOR4CG59dBrETZ2NnXytgiVlYinqOvoy8gANeId4a4KH7WxV1aHKvk1zbyT
         n7LuQeeW+7Y1v1j9HVLAbRjTt0poRRMSVVpQ7lsQUyZL86mK6mCiEzrioyaGxJT9Cs6H
         y9jM9vZnshGS8Ay/Xhicf9E5k0Kk7JKMW5CvYpLz36LKYETiZL81fF59+LD3MStjEGre
         dd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=SD6710XuCGfLCRjEaTIYpMnkGtQ6zZzJk7TYgaQ/Siw=;
        b=hFyohFh6G1RZgkzf22BGwuxiDXISvSKt/ZB5r9F8AwZs2iJ1ZwbMoLnxY5TztjQTtt
         8JwRtrq0hte1b8nhp+ATF+to1+xkoBVyxZacOdSgGI7tK79HCb3+n8Oz3A3LBM6+ApEL
         o+xR1NkBy/XbxtpbHHa9VIxEPV1CLxsBhPQD0aQ/bKRO9NMC1UEEyOo4qMzBKNMp8scQ
         shLGpo2aCDMBc07lO/NpwCPnBMCIvhMQjM8VB8XjaL2zIoL9NY5xhTk4J5aNAa+1kNKz
         wT7cFp3r8MKZNnfDy0RRIp3A9GVZJ7pi8m1elvzzzNBQYVN6oV7YqiZLHK4z0CHsnm7w
         NWIA==
X-Gm-Message-State: APjAAAXI9w61dm87z7CjPY5xnfXRa3G9acaqMFcWFTxcSLtdWPltsTcy
        fbpGhXcVORVioxsbvWT+9FpHtQ==
X-Google-Smtp-Source: APXvYqxYeiVnRfIk5g9EJ6vrTN8Y+jTHPgtnkXSmDuJTA/McKpsjUR7LQKN3ZfU+1S+Sk+mQAszwLg==
X-Received: by 2002:a62:fc93:: with SMTP id e141mr11845222pfh.262.1576438331400;
        Sun, 15 Dec 2019 11:32:11 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id d23sm18846406pfo.176.2019.12.15.11.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 11:32:11 -0800 (PST)
Date:   Sun, 15 Dec 2019 11:32:08 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Cristian Birsan <cristian.birsan@microchip.com>
Cc:     <woojung.huh@microchip.com>, <UNGLinuxDriver@microchip.com>,
        <davem@davemloft.net>, <netdev@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: usb: lan78xx: Fix error message format specifier
Message-ID: <20191215113208.7378295b@cakuba.netronome.com>
In-Reply-To: <20191213163311.8319-1-cristian.birsan@microchip.com>
References: <20191213163311.8319-1-cristian.birsan@microchip.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 13 Dec 2019 18:33:11 +0200, Cristian Birsan wrote:
> Display the return code as decimal integer.
> 
> Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>

Applied to net, thank you!
