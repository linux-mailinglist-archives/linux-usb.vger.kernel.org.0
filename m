Return-Path: <linux-usb+bounces-34841-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMDiH9qkt2lTTwEAu9opvQ
	(envelope-from <linux-usb+bounces-34841-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:36:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B021295327
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98D003013A49
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B6B34C124;
	Mon, 16 Mar 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZR1M3p+5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077134BA56;
	Mon, 16 Mar 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642963; cv=none; b=U+xYRS1E7xLq/AtyeV4zNXfWA2LVS/EWacOQge4HA1b2rQLvEH1vf5duj7LTwN2I+xLIA3NLlgBee9gHmHVRXCeeK4HcL92DLmO3fQydwQBGSPfh00jsUFzdAxcS6WgPAEngfzoDlOQ7hHA2FWCPFZEILAaSZiRbrIjSCMRaF3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642963; c=relaxed/simple;
	bh=G2jvee6Om4pds9VnxIPWjk1ZewxAANyIhj1lLMG/7BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxm6ogzbe+6pBPVfEma6PNbpM2j+wKYbXX7fpZOIV/vu0tVPDVOKoZzw4AjCRLEYntSc6liSZUXTl4q9nKZrHIQ2WCtoYrUlkMNg7yGM8iKCFdowy+M3515xBcZB5upVLlXk+9WE/x7O0GZqNmD4Md94vU2DkKZdXMgYMmtn2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZR1M3p+5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE0DC19421;
	Mon, 16 Mar 2026 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773642963;
	bh=G2jvee6Om4pds9VnxIPWjk1ZewxAANyIhj1lLMG/7BY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZR1M3p+5Jp2DGCOSiXKdSQ0TgDWplKYvXXF29tITIVzidD9iPRxMR8lo41vEx5E6j
	 +emrZ2Kt4GWaIcTyCamwosphTZ4+0X2eg3qfH03gWzTItj6aQ1SuGvn2kyhct6YVH5
	 fkxtp3XxPEzT1/CJVtEL38IJfArBIz0do8ffJKF0=
Date: Mon, 16 Mar 2026 07:35:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Felipe Balbi <balbi@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Heidelberg <david@ixit.cz>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2 0/7] usb: gadget: Fix net_device lifecycle with
 device_move
Message-ID: <2026031632-catwalk-reshuffle-c819@gregkh>
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
 <DH1NU7GOPTJY.149SPB0645W7G@fairphone.com>
 <CAKzKK0pEgC683icYco8YqPDSMWh47SKiZf_g1TX8N3syB2FhBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKzKK0pEgC683icYco8YqPDSMWh47SKiZf_g1TX8N3syB2FhBw@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34841-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B021295327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:17:09PM +0800, Kuen-Han Tsai wrote:
> Hi Luca,
> 
> On Fri, Mar 13, 2026 at 8:40 PM Luca Weiss <luca.weiss@fairphone.com> wrote:
> >
> > Hi Kuen-Han,
> >
> > On Mon Mar 9, 2026 at 1:04 PM CET, Kuen-Han Tsai wrote:
> > > PROBLEMS
> > > --------
> > > The net_device in f_ncm is allocated at function instance creation
> > > and registered at bind time with the gadget device as its sysfs parent.
> > > When the gadget unbinds, the parent device is destroyed but the
> > > net_device survives, leaving dangling sysfs symlinks and a NULL pointer
> > > dereference when userspace accesses the orphaned interface:
> > >
> > > Problem 1: Unable to handle kernel NULL pointer dereference
> > >  Call trace:
> > >    __pi_strlen+0x14/0x150
> > >    rtnl_fill_ifinfo+0x6b4/0x708
> > >    rtmsg_ifinfo_build_skb+0xd8/0x13c
> > >    ...
> > >    netlink_sendmsg+0x2e0/0x3d4
> > >
> > > Problem 2: Dangling sysfs symlinks
> > >  console:/ # ls -l /sys/class/net/ncm0
> > >  lrwxrwxrwx ... /sys/class/net/ncm0 ->
> > >  /sys/devices/platform/.../gadget.0/net/ncm0
> > >  console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
> > >  ls: .../gadget.0/net/ncm0: No such file or directory
> > >
> > > BACKGROUND & THE REVERTS
> > > ------------------------
> > > The deferred allocation causes a regression for userspace tools during
> > > network setup (such as the postmarketOS DHCP daemon). By moving the
> > > allocation out of alloc_inst, configfs returns the name pattern "usb%d"
> > > instead of the actual interface name (e.g., "usb0") when userspace reads
> > > the 'ifname' attribute.
> > >
> > > Investigating a fix for this naming issue revealed a deeper
> > > architectural flaw introduced by the series. Deferring the allocation to
> > > bind() means that a single function instance will spawn multiple network
> > > devices if it is symlinked to multiple USB configurations.
> > >
> > > Because all configurations tied to the same function instance are
> > > architecturally designed to share a single network device, and configfs
> > > only exposes a single 'ifname' attribute per instance, this 1-to-many
> > > bug cannot be safely patched.
> > >
> > > To restore the correct 1:1 mapping and resolve the userspace
> > > regressions, this series reverts the changes in reverse order, returning
> > > the net_device allocation back to the instance level (alloc_inst).
> > >
> > > THE NEW SOLUTION
> > > ----------------
> > > Use device_move() to reparent the net_device between the gadget device
> > > tree and /sys/devices/virtual across bind/unbind cycles. On the last
> > > unbind, device_move(NULL) moves the net_device to the virtual device
> > > tree before the gadget device is destroyed. On rebind, device_move()
> > > reparents it back under the new gadget, restoring proper sysfs topology
> > > and power management ordering.
> > >
> > > The 1:1 mapping between function instance and net_device is maintained,
> > > and configfs always reports the resolved interface name.
> > >
> > > A bind_count tracks how many configurations reference the function
> > > instance, ensuring device_move fires only on the first bind.
> > > __free(detach_gadget) ensures the net_device is moved back to virtual
> > > if bind fails after a successful device_move, preventing dangling
> > > sysfs on partial bind failure.
> >
> > Applying this series on v7.0-rc3 fixes the reported issues for me on
> > Qualcomm-based Fairphone (Gen. 6). For v7.0-rc3 the first two commits
> > need to be skipped, looks like the original commits are only in -next
> > and not in v7.0-rc?
> >
> > Tested-by: Luca Weiss <luca.weiss@fairphone.com> # milos-fairphone-fp6
> >
> > Thanks for fixing this!
> >
> > Regards
> > Luca
> 
> Thanks for testing.
> 
> That is correct. The first two commits:
> 
> - [Patch v2 1/7] Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
> - [Patch v2 2/7] Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
> 
> have not been merged into the mainline yet, so skipping them for your
> test was the right move. This series is based on Greg's usb-linus
> branch rather than the Linux's master branch.

These should all now be in 7.0-rc4, right?

thanks,

greg k-h

