Return-Path: <linux-usb+bounces-38171-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dh/PKEBEGmqS2ggAu9opvQ
	(envelope-from <linux-usb+bounces-38171-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 03:58:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E960AD86
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 03:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D54BF3026C9E
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 01:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0409D30DED0;
	Sat, 30 May 2026 01:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UDjQcS4Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAA1B4F1F
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 01:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106301; cv=none; b=UIiymQj4FFx0j9IPHnm6/fuppbzOew1dH0HiQ9YWNHRFuOVE3ymLrhRKALkjCCCU/Qntlny9qk6liagjrUnG3L1/9z37nN8or0dhX4todbXzPufLJ4mJd9W+7g82QiiNyHRhaaCnFncizuBh47WrJFMhJxUXBjrsPFfcjZQRIz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106301; c=relaxed/simple;
	bh=WpRYT5bGBTN1f2lOm4QUPOZOtAHDtHf+aiEOcjJR4CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZjzR1pWXLJkJSYmTjlUCgR5n802K73UhkThA/aTyw/CYRbmW40/IL783k3v2wtJyiHwCajDCK9aP6OjgP/vzWuZ4vtEQGBM79P/wrWKyjHJX/qdzpW4OAWHxtYrkU3fbumm+LXuMegNR0tvI9GNbj4uUYpbDsH0liJNtbIcx/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UDjQcS4Y; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-516cbde40f2so93454771cf.3
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 18:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780106299; x=1780711099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZU0HIDZYHQ5boppnUydVO41n/nuQm6sg8h1pdf8a34=;
        b=UDjQcS4Ym1D3/Zhy90/2jfW/DHapTi7ZIcX/mTZK1B7AEHzkEVAxb0NAsNbzndvHIZ
         7zgFsbN/5J6y4W76ymMUz+nruRpa0hpRB0pwx8hyDMpbJaiZ2+iHrWt7seV6mYZ0NdpD
         Em2zK2TwZhdpw0azBbKjuWP1aRZKjJhxWex38PRm5xU5LCtiREsKdQfYPZFmO0cbYmqb
         KVrYu3xwn9PAROougWsOYWeIy9qIwg4UD7LgEOURdevbRCCEkxMb3zo/7Z0ypdjT7jQl
         kjyDw/wLsZVk5cZBrHkh6yKzbfWIY1z70c++Tkt7L7OnzqRRZsDbaNb/PAiw8yevPAOe
         Q08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780106299; x=1780711099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZU0HIDZYHQ5boppnUydVO41n/nuQm6sg8h1pdf8a34=;
        b=Uspu78S/jfYADOiZ5Xlo3P9P9ML4phM2vpSR5fX9GeyIdYmQ9mFLimoXCuVTYaVs7U
         YcP/vziB+lCxQ/Rbqm7290tzUVm6HCiJZWgDazS1YhR3WSqnxVCSQ4znl8hZ5Z4Dqg+Q
         uULX+TR5Y13G60LbLJ/Qjoa3T0b5qzWBprKn2CyjEVc3Af/mLtgG07prK7L+Pw4BuxkC
         S7S7313cPrqY2jJdrDfej2I4+9tC18OPKhSwB3OIQHUIV5Kp9ljUvJQ1UGFKWxTq4Obm
         E0TSfScsw1EdQpFqmaKJWekvZLBorWiyL7lvzxnRzFUWUy7eIaCAKCaRUxWWl4mNYfRZ
         s8gQ==
X-Gm-Message-State: AOJu0YxGZSqcSjkYXm7gQ7qikmV5zyLRD/pnx5LzjQFyK25v34jfPn0S
	tjNi2n19MU1d8VcT94EhkZgfh1KMrAAY6WP0nE37+jwMpv6+plnyksiImRQ2w8o1kA==
X-Gm-Gg: Acq92OHSAEMq0GWen9NSh6l3A/MIs+CPuzwG78cUc1ePUd4L6VUB8DADW2IUJho/imm
	83s5yj2wlOl0fqYu020T3F2vR6FVmnbm4okRmh7m9oWhOzCYbhGivasb3p0nJAM2DzECbQ6/D6J
	+8s2mhied6NUIgF/DBT/lAzcJne/R/wqKOaL/PY/o70hG+7C0BN7unUUjEtdZFe44LImNEidW3G
	cjzb3SB1fS9wq22kCK4PgnN7ywhUwteHG3nPZycqfwln6fZkjee8RacCtOLpojko0BcGDZjlPwQ
	rUjX60yTALWeGdO3gr/5bTaDk6GqhxfEyEceOtYZuQB8012uM3zWa/UX2gRfeqLxkvoWLJ7Y8bB
	KBi6K1w0H48Gq60/zEh6XRYFi8qHsddi+2clsMGatzQSrPTAfybaZ6unvEhfvbO9mvS0G09aocI
	wJilSNLgwSSsfPKGSqTaeESkncMUnjqyccobWdAuPNOyUnqH3YIP/Aig==
X-Received: by 2002:a05:620a:2a0e:b0:915:2b21:c74e with SMTP id af79cd13be357-9153d9776camr358869085a.24.1780106299273;
        Fri, 29 May 2026 18:58:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915326016c2sm364354685a.25.2026.05.29.18.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 18:58:18 -0700 (PDT)
Date: Fri, 29 May 2026 21:58:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com,
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de,
	lijiayi@kylinos.cn, oneukum@suse.com, bence98@sch.bme.hu,
	eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38171-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 049E960AD86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 02:52:28AM +0530, Nikhil Solanke wrote:
> Hello,
> 
> I have been investigating a USB enumeration issue affecting at least
> one controller exposing an Xbox-compatible interface (VID:PID
> 045e:028e).
> 
> The device consistently fails enumeration under Linux during the
> initial configuration descriptor read. The failure is reproducible on
> multiple physical machines and also inside a VM.
> 
> Observations:
> - Reproduces successfully on latest mainline linux kernel and also the
> latest lts kernel release
> - Windows successfully enumerates the device.
> - Linux fails while reading the initial configuration descriptor.
> - The issue reproduces across different hosts.
> - The device falls back to a secondary mode (with different vendor id
> and product id) (meant for android support) when enumeration fails.
> This android mode gets enumerated and initialized properly but we lose
> a few capabilities that get exposed when its in the Xinput mode.
> 
> So I collected and investigated USB captures from both Windows and
> Linux via Wireshark.
> 
> Interesting finding:
> 
> The standard Linux path requests the initial configuration descriptor
> using USB_DT_CONFIG_SIZE (9 bytes). By introducing a new usbcore quirk
> and modifying usb_get_configuration() so that affected devices request
> 10 bytes instead of 9, enumeration succeeds reliably and the
> controller remains in its expected XInput mode.
> 
> Additional testing:
> 
> 9-byte request: fails
> 48-byte request: succeeds
> 16-byte request: succeeds
> 10-byte request: succeeds

Probably any length larger than 9 will work.

It would be nice to know _how_ the 9-byte request fails.  That is, what 
is the status code when the request completes?  This information is in 
the usbmon trace.

Also, what happens under Windows?  Isn't a 9-byte Get-Config-Descriptor 
request standard in Windows as well as Linux?

> I do not currently understand the underlying protocol-level reason for
> this behavior and would prefer to investigate the root cause rather
> than submit a workaround.

Most likely the root cause is a bug in the device's firmware.

> Could anyone suggest:
> 
> which USB core paths would be most useful to instrument,

I doubt that anything needs to be instrumented.  If the device doesn't 
respond properly to a standard request, it's the device's fault.

> whether there are existing examples of devices failing specifically at
> the initial configuration descriptor size probe,

Not that I know of.

> and whether usbmon alone is sufficient here or if 
> host-controller-level tracing would be more appropriate?

Can't answer that without seeing the usbmon/Wireshark output.  Post 
whatever you've got, for both Linux and Windows.

Alan Stern

> I would be happy to provide:
> Windows and Linux Wireshark captures,
> kernel logs,
> and the experimental workaround patch.
> 
> Thanks.
> Nikhil Solanke

