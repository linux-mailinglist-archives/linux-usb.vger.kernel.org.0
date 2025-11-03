Return-Path: <linux-usb+bounces-30014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14187C2C7E6
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 15:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 41169349D4E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 14:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1149F33375F;
	Mon,  3 Nov 2025 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b="Pf1WYp6W";
	dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b="BRinBh2K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.tty42.de (mail.tty42.de [94.130.190.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6726B742
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.130.190.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181745; cv=pass; b=HeW3KX66FS5pG+vfa52+wWBOfvRdKhV+FnTkkfZaAs9Zw6NUqFUnVT7k1dj6kmuTSX0X8WdhSAGIj362knvlkrMFk0CmwNI/a9XroLufjeYCJ9ZmdJWApc4FfesggLFBhnLa523GuLmC5Gbcd2bLUHzF/sMCUxlQVRdprPxja1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181745; c=relaxed/simple;
	bh=0P4xCHjW65BbsSNM816yGy9I4tvS7hYu4O/hHpa9cjQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lD9l4kSPrCkHRGbW0SwuIglIC+PjzE6OXjo0zKEVcdeV8hztd4IGJwYHcE0ttIYLA+1qT6O9Awdge6+WjE4KubLH00gYFDVhy4pT0Kv9iouP1aXtOVvkKAWOGcTh3zDr2nV5NhueAS+EqGSTk1Qm7e/5rKvBKD6dpVRBcakMtNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de; spf=pass smtp.mailfrom=tty42.de; dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b=Pf1WYp6W; dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b=BRinBh2K; arc=pass smtp.client-ip=94.130.190.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tty42.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de; s=rsa;
	t=1762181740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7O1hTYAYvVDHswsSkqLO2yB4U1lxQtiE/d9qO9nVX0=;
	b=Pf1WYp6WktI8n4VIV0OK0ziA1bGgHrxtjdGbZRSTq1mwpmU7kOLbk1V+vRf5quiAZmqUyq
	rbmVCkUQj61H66jtnUYCOLkuq3KpekV1uBZAzUpkgaXrr/A+aDWqGMYQSCjPmVoqAZqJEj
	fhSS0JZKDBrazRhG2oED8RMNDluzfx7UjbVz4aYKrOKt0vGEWNSiJVUCKzAM/6XKb28OHd
	GXBelRzRRjWo/IwBQVynTPD7AqsJ08tfN4Rs0X5pq2CICUJ1IZbVxBXjixyUe4B7YPxySV
	vfpiaOkjU0EPJad59QB3KzykG7sG/XuKbfaw0DYm+QFnK75HovDo3inNsP46Vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tty42.de;
	s=dkim; t=1762181740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7O1hTYAYvVDHswsSkqLO2yB4U1lxQtiE/d9qO9nVX0=;
	b=BRinBh2K7ncikEQ4EpeTICtyyNLFELziwmVNWkKejuIuEFM2Qgc5X34UaFW1xKxbI/adb0
	cye2ye6J3SpGdkCw==
ARC-Seal: i=1; s=rsa; d=tty42.de; t=1762181740; a=rsa-sha256; cv=none;
	b=3LM+TKeKlW/ltz+ab3+Hb1tKLbby4QuVZuZRIL19Fd3VsOeIvSLs51ZNrroGRlggQVfxJD
	Fj6piTt340tZpOGrz41qECq2kUeSu3+igCpUq2lCTQopefYI1rMXvtWpvACGkqBcwdjvNY
	ZAecYOqf4HPU2ZMwaPmolDGrsAAKcoJUZkgz1q0Y3EYrzODu+8hTch82KRMAbXo7u0wVNB
	aE9FiYa8c3kms6Plyc+aQt0pMGwIUu0df71w6wKw61jS7xgY4Bsr1sQYbYkjJsDl7MI2d2
	yEI1LAXVBJtW432ENZ+TETaydhMYvGf5Mb9kesXaL1iLQZVgUc2J/ZLoEX8zKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de;
	s=rsa; t=1762181740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7O1hTYAYvVDHswsSkqLO2yB4U1lxQtiE/d9qO9nVX0=;
	b=t+UYwGhnNqCiBkM3JKN/KIzNfYEURta0coTa5rbbvACzAJrW5+gh7WcbmQtFpT1z10Bj9L
	7tB005Tu8nmzy+M6kgJqHhUDl7j7vZqfWUgPkXm1osa9ASD54DIK6uOr1P+zLxoc74dfQG
	UHWDFFkWUPjhU/bcOR5P52Az5nmhnyQQDOqrsAHpzP18olvvLS6KvksriYNA9yFcZyV706
	izdnKPPPwG9DJZ8Eiz5INqth4GNbOvjuzJic1iH11i4UddqAreAsC+LS5OcMX6DhEwgggv
	0vYHVkE8S34ewQkhggycQCsgjq5iyAN/vbydVHyhIlMWmnTzpyK2RK/rBsHkeQ==
ARC-Authentication-Results: i=1;
	mail.tty42.de;
	auth=pass smtp.auth=frederik@tty42.de smtp.mailfrom=lists@tty42.de
Received: 
	by mail.tty42.de (OpenSMTPD) with ESMTPSA id 8142c106 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-usb@vger.kernel.org>;
	Mon, 3 Nov 2025 14:55:40 +0000 (UTC)
Date: Mon, 3 Nov 2025 15:55:38 +0100
From: Frederik Schwan <lists@tty42.de>
To: linux-usb@vger.kernel.org
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <ajlvz22hv6qfdcu7goeyaguargegkc4mq5cvetghgfr2fsej6f@hr2j4lspurus>
Mail-Followup-To: linux-usb@vger.kernel.org
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
 <20251103055659.GD2912318@black.igk.intel.com>
 <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>
 <20251103102639.GE2912318@black.igk.intel.com>
 <lerwgbxoidxvfv3ajszi467rupujg465ukh3fcokihxpv2ikjr@rbke2a76anld>
 <20251103112648.GI2912318@black.igk.intel.com>
 <aQibKLARkpPVLckj@ideak-desk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQibKLARkpPVLckj@ideak-desk>

On Mon, Nov 03, 2025 at 02:08:08PM +0200, Imre Deak wrote:
> Hi Frederik,
> 
> On Mon, Nov 03, 2025 at 12:26:48PM +0100, Mika Westerberg wrote:
> > Hi,
> > 
> > On Mon, Nov 03, 2025 at 12:01:06PM +0100, Frederik Schwan wrote:
> > > Whole log attached.
> > 
> > Great, thanks!
> > 
> > From that log the last BW allocation done by i915 is 12.5G:
> > 
> > [   51.572497] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allocation changed to 0/12500 Mb/s
> > 
> > > > Regarding the script, that's odd too but it could be that you have more
> > > > than one host router there (it is not clear from the truncated log). You
> > > > need to build the tbtools binaries though.
> > > 
> > > I do package tbtools for Arch so these are available.
> > > 
> > > tblist gives me:
> > > Domain 0 Route 0: 8087:7eb2 Intel Gen14
> > > Domain 1 Route 0: 17ef:a583 Lenovo ThinkPad P1 Gen8 / T1g Gen8
> > > Domain 1 Route 1: 0108:234d Lenovo ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA
> > 
> > Okay this has discrete Barlow Ridge TB5 host router.
> > 
> > > tbadapters --domain 1 --route 1:
> > >  1: Lane 0 (upstream)             CL0
> > >  2: Lane 1                        CL0
> > >  3: Lane 0                        CLd
> > >  4: Lane 1                        CLd
> > >  5: Lane 0                        CLd
> > >  6: Lane 1                        CLd
> > >  7: Lane 0                        CLd
> > >  8: Lane 1                        CLd
> > >  9: PCIe Up                       L1
> > > 10: PCIe Down                     Disabled
> > > 11: DisplayPort OUT               Disabled
> > > 12: DisplayPort OUT               Enabled
> > 
> > And this confirms that the DP tunnel is up.
> > 
> > That tb-bandwidth.sh script should work too (or tbtunnels -d1 -vv).
> > 
> > Anyways, from TB perspective this looks okay. Not sure about graphics. Imre
> > do you see anything?
> 
> Could you please try booting with 'log_buf_len=20M drm.debug=0x10e
> i915.enable_panel_replay=0', provide a dmesg log after booting and
> connecting the same dock+monitor?
> 
> If the above works around the issue, could you please try if applying
> the 7 patches of the [1] patchset fixes the issue (booting with those
> patches applied and without the i915.panel_panel_replay=0 kernel
> parameter)?
> 
> These same patches rebased on v6.17.7 are also available at [2] or in
> the latest v6.18.0-rc3 based drm-tip tree at [3].
> 
> Thanks,
> Imre
> 
> [1] https://lore.kernel.org/all/20251015161934.262108-1-imre.deak@intel.com
> [2] https://github.com/ideak/linux/commits/fix-mst-dsc-panel-replay
> [3] https://gitlab.freedesktop.org/drm/tip/-/commits/drm-tip
>
We had a small conversation off-list.

Modified (for 6.17.) params work. Patches do as well. Thanks alot!

Tested-by: Frederik Schwan <freswa@archlinux.org>

