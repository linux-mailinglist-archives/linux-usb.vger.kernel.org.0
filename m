Return-Path: <linux-usb+bounces-37594-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qApYE1jwCmpv+AQAu9opvQ
	(envelope-from <linux-usb+bounces-37594-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:56:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA2156B0FD
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2326C3016825
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2E43EF666;
	Mon, 18 May 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0S2OtjY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9602F8E85;
	Mon, 18 May 2026 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101762; cv=none; b=H41e4donl2Dhpo+d0NipZ21ZvEJfCGFhPM+h61OKFELY4Hx3GWungE5NdhuMlMiXiELF//v6zIXLDlv8hI3G2fUWUXAjGbnr2iCfoEHJHEKSOLAqDMWtYk2UYA0fMOuqu4nOWvYsfqicJK6gkmkkvLb5EDAsBPgYjoNOzaSjS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101762; c=relaxed/simple;
	bh=s+H4qloUaK7h9YV6iKxkiB0sfql8QGy5REcwMeMjKqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvoH5Z/ixfCETkXN8sGM/xaS6Dvxpl4z/Da1vd3w7lyEJwSLPwizM4oM4NiQr5Wzp/pFQc21aNsIsOQiVKwdXWrCDRk4PjusY09Gddxk8rEvBUZCvGYh+CFEXi7Jhu4rbIdF6PziPnn5ER5OcvXP9r6QroxoVvOQHA363Ub5n20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0S2OtjY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779101760; x=1810637760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s+H4qloUaK7h9YV6iKxkiB0sfql8QGy5REcwMeMjKqE=;
  b=j0S2OtjYhkpERtgeAmcnF/Xpc72D+I6ywtU6QAm0RSt5kdCjX1CONxWF
   FFisb+1IxPT7Apv2GRq+JO2Ar79thRMfeMcXowNEKbvCDO7qz4vGIjJFp
   EDY4YihxXzL/qZzUtzYTGghjohdg9dbx48OSI9ASe6AMk3gzqJiMtiXuo
   iq/qasSlZVZiOLGVSJhF79DDNPWU1f2ivYbcxFIj8gT8SyEM0j9UwBOUg
   iQIFrlnlF5dRAqi1zm7jz96G1/yT3oEfv/Ig+jT28aUb/fhmb53YPHvET
   OZsxL7JCh7O0opIXnnam1kGmHYZ+dtJsxEbv/1kPU33/JuEUHme0TTwoG
   w==;
X-CSE-ConnectionGUID: 6uJmIXYAQJawx9zzqNdSQg==
X-CSE-MsgGUID: W3JbTWEeS72KSkprgNFnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="78974656"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="78974656"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:55:57 -0700
X-CSE-ConnectionGUID: 89+Zz1ZSTDC9dspkXgb6NQ==
X-CSE-MsgGUID: 6WA74LP9QbSjmG+B2oOf8Q==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 18 May 2026 03:55:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 223AE95; Mon, 18 May 2026 12:55:55 +0200 (CEST)
Date: Mon, 18 May 2026 13:55:53 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH 1/8] usb: typec: wcove: don't write past struct
 pd_message in wcove_read_rx_buffer()
Message-ID: <agrwOYXfdXm6mn00@kuha>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
X-Rspamd-Queue-Id: DFA2156B0FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37594-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:52:48PM +0200, Greg Kroah-Hartman wrote:
> wcove_read_rx_buffer() copies the PD RX FIFO into the caller's
> struct pd_message with
> 
> 	for (i = 0; i < USBC_RXINFO_RXBYTES(info); i++)
> 		regmap_read(wcove->regmap, USBC_RX_DATA + i, msg + i);
> 
> which has two problems:
> 
> USBC_RXINFO_RXBYTES() is a 5-bit field (max 31) while struct pd_message
> is 30 bytes (__le16 header + __le32 payload[PD_MAX_PAYLOAD], packed).
> The byte count latched in RXINFO is the number of bytes the port partner
> put on the wire, so a malicious partner that transmits a 31-byte frame
> can drive the loop one byte past the destination if the WCOVE BMC
> receiver does not enforce the PD object-count limit in hardware. The
> existing FIXME flagged this as unverified.
> 
> Independently, regmap_read() takes an unsigned int * and stores a full
> unsigned int at the destination. Passing the byte pointer msg + i means
> each iteration writes four bytes; the high three are zero (val_bits is
> 8) and are normally overwritten by the next iteration, but the final
> iteration's high bytes are not. With RXBYTES == 30 the i == 29 iteration
> already writes three zero bytes past msg, which sits on the IRQ thread's
> stack in wcove_typec_irq().
> 
> Clamp the loop to sizeof(struct pd_message) and read each register into
> a local before storing only its low byte, so the copy can never exceed
> the destination regardless of what RXINFO reports.
> 
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/wcove.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
> index 759c982bb16a..0e5a3e277c3e 100644
> --- a/drivers/usb/typec/tcpm/wcove.c
> +++ b/drivers/usb/typec/tcpm/wcove.c
> @@ -444,9 +444,11 @@ static int wcove_start_toggling(struct tcpc_dev *tcpc,
>  	return regmap_write(wcove->regmap, USBC_CONTROL1, usbc_ctrl);
>  }
>  
> -static int wcove_read_rx_buffer(struct wcove_typec *wcove, void *msg)
> +static int wcove_read_rx_buffer(struct wcove_typec *wcove,
> +				struct pd_message *msg)
>  {
> -	unsigned int info;
> +	unsigned int info, val, len;
> +	u8 *buf = (u8 *)msg;
>  	int ret;
>  	int i;
>  
> @@ -454,12 +456,13 @@ static int wcove_read_rx_buffer(struct wcove_typec *wcove, void *msg)
>  	if (ret)
>  		return ret;
>  
> -	/* FIXME: Check that USBC_RXINFO_RXBYTES(info) matches the header */
> +	len = min(USBC_RXINFO_RXBYTES(info), sizeof(*msg));
>  
> -	for (i = 0; i < USBC_RXINFO_RXBYTES(info); i++) {
> -		ret = regmap_read(wcove->regmap, USBC_RX_DATA + i, msg + i);
> +	for (i = 0; i < len; i++) {
> +		ret = regmap_read(wcove->regmap, USBC_RX_DATA + i, &val);
>  		if (ret)
>  			return ret;
> +		buf[i] = val;
>  	}
>  
>  	return regmap_write(wcove->regmap, USBC_RXSTATUS,
> -- 
> 2.54.0

-- 
heikki

