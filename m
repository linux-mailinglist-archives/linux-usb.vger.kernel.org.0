Return-Path: <linux-usb+bounces-33875-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDKCIteLpWmoDgYAu9opvQ
	(envelope-from <linux-usb+bounces-33875-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 14:08:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 280FB1D97E3
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 14:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A2213047056
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF4635AC22;
	Mon,  2 Mar 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VZLMM3Tv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683AF36C9E4;
	Mon,  2 Mar 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456735; cv=none; b=tLmbYUXugmjKB9+mOcViGUpVYiynUN+FAgRkbfdecBzlG1l3I18xLL2VMTdeGFGaOcmgO0eoOkiTuT8wMXBqXXXHMXD2d58QsJKIGBpDvpKpwzobxEHm0kOsMcy4DhevfQwzWpRHArHZJfYwVvHIpvhtIDpAveIWFdUX/vGT+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456735; c=relaxed/simple;
	bh=LtZcffSzdjXBMJuNgkyDWnWWiDMKC/CD7SrNeEHAHao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDowimubiy5ViL2baCoQkdn9urwp7kv/NoXI+6jOM5kv+1EkYcCemKpW96wL6Zaft2NJA21v4d5LUhR3FFoyIHU5VcSY280qwfe2CXZMGGyn/52y7DpyNLKXUJgkQSl0J+WsqE3++1XW0pcBAV9L8PaiOaC+xgNgz2MsKVE1X8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VZLMM3Tv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BF0C19423;
	Mon,  2 Mar 2026 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772456734;
	bh=LtZcffSzdjXBMJuNgkyDWnWWiDMKC/CD7SrNeEHAHao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZLMM3TvYCHSaIUsGKmo4hev6Iz+jcKUgdxg9UTqpxKm5rhg/eq6zGfCyDuu8a/u9
	 oxMiDE9O3aBpMhECA0dyJQz3VurhdSiA37/ygKlftDO/Q1k532pAME7qVRTtlb0eeA
	 ks5t7bck9ik58lna/r0iRtK8zprRBBXwIrHXgj+k=
Date: Mon, 2 Mar 2026 08:05:23 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: David Heidelberg <david@ixit.cz>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org,
	kernel test robot <oliver.sang@intel.com>,
	LI Qingwu <qing-wu.li@leica-geosystems.com.cn>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: Re: [PATCH v2 0/2] usb: gadget: Fix g_ncm regression and atomic
 sleep in f_ncm
Message-ID: <2026030202-willed-shore-7eea@gregkh>
References: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
 <70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz>
 <CAKzKK0p0d1MCuOm1O3JCz3mF8jr+vV3NnDN9Wuc_A2OCgiRz_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKzKK0p0d1MCuOm1O3JCz3mF8jr+vV3NnDN9Wuc_A2OCgiRz_A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ixit.cz,vger.kernel.org,kernel.org,intel.com,leica-geosystems.com.cn,gmail.com];
	TAGGED_FROM(0.00)[bounces-33875-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.342];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 280FB1D97E3
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 06:15:19PM +0800, Kuen-Han Tsai wrote:
> Greg, do you have any thoughts on the best way to untangle this? I am
> fully willing to submit a revert for this series to restore the
> expected behavior while we figure out a proper architectural fix.

Please submit a revert so we can take the time to untangle this.

thanks,

greg k-h

