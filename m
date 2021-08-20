Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EB23F2C90
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240375AbhHTM6S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 08:58:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237844AbhHTM6Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 08:58:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A627A601FF;
        Fri, 20 Aug 2021 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629464258;
        bh=bbHE8vwP7rau/CrTipj+l6QlGlHBPfy5negGReaAAkU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=odJF2/u1XDq/gehzAYZdUZK61pDnZPyreXdznfqbueB+hjFkV6usPKwfrki2782M+
         MC+PyjyP3+3jrAGVSr5SBDOwOh7/g8l1ma9hYx4DoU2ZAuFyrgfapHfMN1M7c3eTEB
         1jCdbi1ZKWUZzIaYFzHsSAlkIulZI+WzFDkTmXL+B/Fb70vCD4zaK69zaIuEqywpJi
         QfmS2WBMdAY0oX4X0eMlCJ3erjImNZ5Gj66EyCEoWdbS+5qW5Gzj1XgfQgbULuCCbe
         Y2mRRWYYD9wd6fKLj4uur3Mo1rwHxks1CsgRzDtvPt+omVbS+3OTRbHVHQAEwe4WJq
         Nt4TZWMgAF+PQ==
Date:   Fri, 20 Aug 2021 14:57:35 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Ulrich_Sp=F6rlein?= <uqs@FreeBSD.org>
cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] HID: sony: Fix more ShanWan clone gamepads to not rumble
 when plugged in.
In-Reply-To: <20210814155214.83856-1-uqs@FreeBSD.org>
Message-ID: <nycvar.YFH.7.76.2108201457100.15313@cbobk.fhfr.pm>
References: <20210814155214.83856-1-uqs@FreeBSD.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 14 Aug 2021, Ulrich Spörlein wrote:

> The device string on these can differ, apparently, including typos. I've
> bought 2 of these in 2012 and googling shows many folks out there with
> that broken spelling in their dmesg.

Those aftermarket producers can be funny sometimes :) Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

