Return-Path: <linux-usb+bounces-35710-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE61M9cqy2n8EQYAu9opvQ
	(envelope-from <linux-usb+bounces-35710-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 04:00:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5033633AF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 04:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5033C3043D13
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 01:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0533659F6;
	Tue, 31 Mar 2026 01:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kNFYXLoo"
X-Original-To: linux-usb@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0E14A0BC;
	Tue, 31 Mar 2026 01:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.62.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922346; cv=none; b=kaJmu0Vh9uND1QPD1vMaitJmHZGLI5d/miy0vCi8T5sH8ciUTEdyjOovcGtg0J6E62DpwLnnholzZ/YGj++XSJ8hp+WNtQRXtWlJnVKM1qFNQP0/sAfhtwA9W2SHCHaRblMjGKP1GKwPZGruaba4fEok40cZJ0f8EL19lCNWD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922346; c=relaxed/simple;
	bh=6LSm60n2ygd+2xm+I2B5kO1Fidf0iltbaKeD/u3dN/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhMt/srmV/zOLRwMqC2EP4Nc4Dh0HhKbUFtILGZ902ijZv3kwctZ7arBHohuMdtkrTnaG7989fiouTIrpXfsilCIepjLK8KUN71JB9NxGUdvVDzGyuwu5i5Xv1RrPVhl6GIbDXNYqvNPdNgJ2jATQgomjTuHpv6Z1Nu7+B7jtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kNFYXLoo; arc=none smtp.client-ip=114.132.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774922246;
	bh=XtgU7u3m8ATvONww0EjKILjjpqHOKR3iuEbKdN8Zh18=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=kNFYXLoo43sI7yOa4HgQf+ZpzEqgmz0c0YifIp8z4mxDRC8QABKZQtTGzQvR/beD0
	 /62wdLfZpSaVcqJhnY840Vws74eQuMRg68EU+hx8IIc+lCyiltIbMIldXTMCmNVqu8
	 p4G0iyN5sJnZQAYR0vUgpqwLqxF9ENMXBvmKnKBQ=
X-QQ-mid: zesmtpgz6t1774922244tcdd95944
X-QQ-Originating-IP: 6YTJ4mxqFD3mYgJQ7VaqcOKTTPDpfV95ifWMMz/gHXs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 09:57:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16396334203676912159
EX-QQ-RecipientCnt: 10
Date: Tue, 31 Mar 2026 09:57:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Chukun Pan <amadeus@jmu.edu.cn>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Message-ID: <BC093802795A0616+acsqAiB_4ptd2k3t@kernel.org>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
 <20260326100010.3588454-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N71rnkwxYMwyqDkeb55/NvMDEqSgm7/4SH7D0+05HAhIygSSF/ipEuiQ
	ZPRO8cfgoX8QxnALzWS1U1fFKcEhNjprWwfeWVv56OjHCC0QKv9IncbeCkZK6+Dhgg+E9o6
	cx0NsceGNWe7GvUXcSzoOp/rHUH4dg3tbTJ1jnW5pDi9oIq0rFytivjLmSUBfy4Dopm8jV0
	fwue1smcxzuASeSXjMDrICUYsOZxTT5fiK2EbQQhCKehNXRnRDwo+EY4wyKyaSxx+Hd+CLq
	PfgTrD+12hyOWVh/CEWMpgud+LyN2ZNwixsyCSvAjzfhInPSNKrxjqr1LZPKozyoqYGevCs
	EVbPQFoymdSVnHfvwDc3QCAizMzqqAdZWnqcZsT7+Qwb7taHr/HsDiyC8zCawtcI6RUDPNt
	9R7v42TUjzsjOi1donsy6n/+tqoEJ8qI1YRBtBjaQlZi5ktejNkOrb5s7TeCrCa7uIneynv
	h8V+0LLhfyYt6GabARAErSFcNbU9jR8bZsMyk9M8Ya/1/SM7CHqW7zF/Ep0uAPmRdLrybG2
	Iw6AUn1R2xI09vuwzAEglKTCmXHaPgrhHoE2uYJ0SWLdXi8sLbvu8dNxsuqFxrwVkgMdZz8
	7kYcw23dfPO32mprJlWP9w+Cr/iyfyAwcIYwBL0Y1iaajYNx93g6Li/3txxHqPFFK2dJdXH
	ymbYcPAv2tfTbn+XWYIN50hRcQF9SudADoK04BelcRQ+dS4Vm219gy9DXHAn6gmsnDZgIqO
	9ChUMcqFUCEbBNDjvRzOrCzR9X5Q29VvendhleXaOckG/Y+hTqBOUD60l2rNMEXmXi01mfI
	HcqGh9TbqJfNEKghEkMmZCzpPQ+2hF9tdbWhaU34lwRWITfd+J5NIcZsBcWHv1f920f62kG
	MHWfLV98RmTrhz5rWZQ41kzH4wa/wWTM33A6DVhTvWGPja32E4Erj/Kj6D8XjpHht4E3P+k
	zmLo7RpA3TvWpiHDrDEacan2AsY18P1V0wT8T3wYf7OqM1QCxXmdAHMBqx1B29pl3DuNxzn
	Pvd6ZWu8hOMcvPw/8m2uKsnasVMkYxQLvmW7w7Bq1QcGuV2rqVmYvEWPSHNTw=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.spacemit.com:s=mxsw2412];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[spacemit.com];
	TAGGED_FROM(0.00)[bounces-35710-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.spacemit.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[troy.mitchell@linux.spacemit.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spacemit.com:email,jmu.edu.cn:email,linux.spacemit.com:dkim]
X-Rspamd-Queue-Id: 4C5033633AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 18:00:10 CST, Chukun Pan wrote:
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
> 
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Thanks for the patch.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

