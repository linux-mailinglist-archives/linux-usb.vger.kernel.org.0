Return-Path: <linux-usb+bounces-34745-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG0tEuAFtGnjfQAAu9opvQ
	(envelope-from <linux-usb+bounces-34745-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:41:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A252D28329C
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A24302A55E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEFF38655A;
	Fri, 13 Mar 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="m5iCCBby"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F53822AF
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405661; cv=none; b=fEDpGGrXkXhu/iLInP87n5kRS/ksS7LuGF42/aZZfVCeQlVpR+xDb1x573qL1uF4r6yI8r508M7MqiEurTflz52nW0O9x9MVrXGzNBEpUqsGDPNd7eEG1m3A5xEyf7gbkTzPZetlJtSBiBixEnd4NwfdDUuFAL+rg0KU/a429bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405661; c=relaxed/simple;
	bh=vMlORAt4cIj9y6zXy3C5Rkdql4j2VAXzC+gB7tFbydI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mDItMWM92hrFpV5wBt4bbFasIvaTPix8A5W9ByLMVbol5jTBHrXtSFcxhlDbXYLdIukyZKdBesVYVZFNlHVNqrWlPm1r2brN8Jq7a2rxp/QxbTwpguhW7L3RSvRaHGJXEeLSpZpxNfwHF/GTh+oKY/y4hKE2QKZagbxaRp/Q0XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=m5iCCBby; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so19640175e9.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773405658; x=1774010458; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfn1fOOKJySp+MZNu6YVwSfAvLP9ZgswVIRNDlPFWRM=;
        b=m5iCCBbyYdIimFiJPmS7NHk431+doHWxY58zMOrLVhefnh4N9B9a1Zdm3acdP2vnwf
         YPlIKBoIcO6+HWrzD/LtEAqDOuhrfDn/jlah9rn4Tq0SmJMnJI7s+KiECeF8zUHr9kja
         WejOXkB5zpyt9+MPyPV5b/7jdV1aQxu7uguQqZguQhRN16C7naQTGxsmTl1c2GXCvTqI
         Sp3ndPgevdrbfyltVVY9wU0SB4nvOxkoOkWDgscEFhB22VFKe7Iszq7OhMi5dW0VH2cC
         /Ok21wrYC7NJbAYcUwwl4MUvyWM9zlvigxt03harLsxn9P/a3UrZxBnothNGgmuIW/c+
         BhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405658; x=1774010458;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfn1fOOKJySp+MZNu6YVwSfAvLP9ZgswVIRNDlPFWRM=;
        b=HQtHMB/WxgUgiHRzB2xPQOLmj3Y7EUKfpxr6Pd72xhaB5SL/JwI8rAEzy1m0pAetKN
         aYlj9WFvIQl52et4tzfheFchENm0IGCMKO6UdwbeRx3uL55Fc/Bre3+fNoG71jKtIij9
         GGlzfiVIox5LWl5tQs8y8uOhSHS6O0GWDsvZXCEWZrNSMwJrJvIQJzwf/vkVdf/RgoI2
         uj/CR7kcMduhxAXZrhIAq92VUnjYm4XFkLC7f3f5WThc62UL/M/Rs2iRAU4xSWawRWXn
         XjBEX+cfQjgtAMaoq7P8savSDOi/n7G0wTHbdRTAfLV4LmB7NT+wkdL/UGyYDB3mLkBR
         Rriw==
X-Forwarded-Encrypted: i=1; AJvYcCWUIGkvjMVSjZUZJEyNXVmqa1bEXL8zj69Qf05HxfGTAp65VYDGmKdX4TdjRu4DsTZyV0eyi3FNvmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhnYp7rOO6WaUvICIYJuf5aji7csRXe72+Q+QSkp5/0UT6esS
	I3cKvvnUIsg6TOYwUQpueWJ3LZVXs40ETCV2BJDsKsqoZlebtLeOhStEBVECSPabpEs=
X-Gm-Gg: ATEYQzwQj0VXvAFn1R2Qsc1ewK/ANfG7d3x6Uwu3rgmlixVyKnhOa+nJLBn4uEH9/yo
	9CoRWDyJErjTm9/628YcNazdSDJA+uX7FsMny3Vm+KXJkprAa6ExKo9a9KtlCoS2WXKpvJXU7Tu
	6D5qhXuSHv6UBYN5DYP+vcs6H7fd023fcsBorz5Vkh/SzVG0W3c9O7HxsXedNzp7Jm9kCytft4l
	i5P/Bst206nTiWPSnyNaXagX5R7X3LGB5VxMAt+R+n2FFkFCP6VMxOKUnuczblmL9k0VLZsdgJt
	bB9He9lekJiqbTlGCIpctz9o8MwLmxRKWvgSAXD6OJcgVsN6c9fL1exC8aITigxpSO86IbZZnr7
	3PioIP+LLbpkr3hsJ0Z8rQekQBVnEguxabMp0vpU+xQSUMaCIutuFIEz6jSS9fB595ytQnDunmO
	fQ6dfAIWDgRffAkZP/M1Q9baKGyLSMzT60y4xlWGFHQNKoj9VDTDpjFjlitburg0hfbbZ0
X-Received: by 2002:a05:600c:3545:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-4855670513bmr50876245e9.23.1773405657731;
        Fri, 13 Mar 2026 05:40:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2187aasm15314223f8f.30.2026.03.13.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 13:40:56 +0100
Message-Id: <DH1NU7GOPTJY.149SPB0645W7G@fairphone.com>
Cc: "David Heidelberg" <david@ixit.cz>, "Ernest Van Hoecke"
 <ernest.vanhoecke@toradex.com>, "Jon Hunter" <jonathanh@nvidia.com>, "LI
 Qingwu" <Qing-wu.Li@leica-geosystems.com.cn>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@kernel.org>
Subject: Re: [PATCH v2 0/7] usb: gadget: Fix net_device lifecycle with
 device_move
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kuen-Han Tsai" <khtsai@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Felipe Balbi" <balbi@ti.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	TAGGED_FROM(0.00)[bounces-34745-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: A252D28329C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuen-Han,

On Mon Mar 9, 2026 at 1:04 PM CET, Kuen-Han Tsai wrote:
> PROBLEMS
> --------
> The net_device in f_ncm is allocated at function instance creation
> and registered at bind time with the gadget device as its sysfs parent.
> When the gadget unbinds, the parent device is destroyed but the
> net_device survives, leaving dangling sysfs symlinks and a NULL pointer
> dereference when userspace accesses the orphaned interface:
>
> Problem 1: Unable to handle kernel NULL pointer dereference
>  Call trace:
>    __pi_strlen+0x14/0x150
>    rtnl_fill_ifinfo+0x6b4/0x708
>    rtmsg_ifinfo_build_skb+0xd8/0x13c
>    ...
>    netlink_sendmsg+0x2e0/0x3d4
>
> Problem 2: Dangling sysfs symlinks
>  console:/ # ls -l /sys/class/net/ncm0
>  lrwxrwxrwx ... /sys/class/net/ncm0 ->
>  /sys/devices/platform/.../gadget.0/net/ncm0
>  console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
>  ls: .../gadget.0/net/ncm0: No such file or directory
>
> BACKGROUND & THE REVERTS
> ------------------------
> The deferred allocation causes a regression for userspace tools during
> network setup (such as the postmarketOS DHCP daemon). By moving the
> allocation out of alloc_inst, configfs returns the name pattern "usb%d"
> instead of the actual interface name (e.g., "usb0") when userspace reads
> the 'ifname' attribute.
>
> Investigating a fix for this naming issue revealed a deeper
> architectural flaw introduced by the series. Deferring the allocation to
> bind() means that a single function instance will spawn multiple network
> devices if it is symlinked to multiple USB configurations.
>
> Because all configurations tied to the same function instance are
> architecturally designed to share a single network device, and configfs
> only exposes a single 'ifname' attribute per instance, this 1-to-many
> bug cannot be safely patched.
>
> To restore the correct 1:1 mapping and resolve the userspace
> regressions, this series reverts the changes in reverse order, returning
> the net_device allocation back to the instance level (alloc_inst).
>
> THE NEW SOLUTION
> ----------------
> Use device_move() to reparent the net_device between the gadget device
> tree and /sys/devices/virtual across bind/unbind cycles. On the last
> unbind, device_move(NULL) moves the net_device to the virtual device
> tree before the gadget device is destroyed. On rebind, device_move()
> reparents it back under the new gadget, restoring proper sysfs topology
> and power management ordering.=20
>
> The 1:1 mapping between function instance and net_device is maintained,
> and configfs always reports the resolved interface name.
>
> A bind_count tracks how many configurations reference the function
> instance, ensuring device_move fires only on the first bind.
> __free(detach_gadget) ensures the net_device is moved back to virtual
> if bind fails after a successful device_move, preventing dangling
> sysfs on partial bind failure.

Applying this series on v7.0-rc3 fixes the reported issues for me on
Qualcomm-based Fairphone (Gen. 6). For v7.0-rc3 the first two commits
need to be skipped, looks like the original commits are only in -next
and not in v7.0-rc?

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # milos-fairphone-fp6

Thanks for fixing this!

Regards
Luca

>
> Reported-by: David Heidelberg <david@ixit.cz>
> Link: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c95113124=
9af@ixit.cz/
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---
> Changes in v2:
> - Introduce a new solution
> - Link to v1: https://lore.kernel.org/r/20260304-f-ncm-revert-v1-0-57c915=
7b58af@google.com
>
> ---
> Kuen-Han Tsai (7):
>       Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
>       Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
>       Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/un=
bind"
>       Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing n=
et_device"
>       Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
>       Revert "usb: gadget: u_ether: add gether_opts for config caching"
>       usb: gadget: f_ncm: Fix net_device lifecycle with device_move
>
>  drivers/usb/gadget/function/f_ncm.c            | 129 +++++++++++--------
>  drivers/usb/gadget/function/u_ether.c          |  67 ++++------
>  drivers/usb/gadget/function/u_ether.h          |  56 ++++-----
>  drivers/usb/gadget/function/u_ether_configfs.h | 168 -------------------=
------
>  drivers/usb/gadget/function/u_ncm.h            |   5 +-
>  drivers/usb/gadget/legacy/ncm.c                |  13 +-
>  6 files changed, 127 insertions(+), 311 deletions(-)
> ---
> base-commit: 1be3b77de4eb89af8ae2fd6610546be778e25589
> change-id: 20260304-f-ncm-revert-490a66ae8da0
>
> Best regards,


