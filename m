Return-Path: <linux-usb+bounces-37814-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCjIAvaRDmq8AAYAu9opvQ
	(envelope-from <linux-usb+bounces-37814-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:02:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2959EECE
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1793302D104
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 05:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D5533F8B4;
	Thu, 21 May 2026 05:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="atBJk9hP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E515334C1D
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779339690; cv=none; b=WpGlZLx+U409OgDlm8ot2xfgyZdB87I4Dh0B7ypmKJp7wislvIJFRkx4wiRRR3Qao6ICJn87FVImH9qtq8U8pA9Z1v4YBHAy3P6QIMQNmzpWqbTjKDq7wErDsv+mMCJh1GBd73XsDLnm21UONkM7+mEWpwm+NwLBKGTAFkWbccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779339690; c=relaxed/simple;
	bh=iVLb5e1ifsXgBUkhpZ1VHH+Nx2xXMNQ3qtSGYR82lwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1LbjGxWG4GQwpisIoMKn+/MEx+5GDEfRlgi+2kz0HHa2ZT0ucTTXztiUpHF0MQvUc3x2sbxc0CHKi3UjkA4L8UIRy/4j/KtpndkO+jt5CgSBO/Nq8gloeQiiow8y3+LToubFVjAOoCuJlZSC9fyNfFvM8gVuqrwx25yC6xFxFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=atBJk9hP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so57548965ad.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 22:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779339686; x=1779944486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BvJuHVv9eiYWj3ZSTMQfkj6w3gQGBBgxZXCsxd2MBno=;
        b=atBJk9hPCkjE15Fuzo2k62aG/L5W5EjuiRNsxOPYObo3YKqK2qnn9OO+x4GvbP3Qfr
         3NjBslILg7jHOjLu3FhEM6XHOA+fkHwJUh6MQ4Xyt/Jr8dpPNS2GpdDnK9j+oUmeh3jt
         QpWUNIJiYA3KwDpX9/+63VI3LBVQii30OSGjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779339686; x=1779944486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvJuHVv9eiYWj3ZSTMQfkj6w3gQGBBgxZXCsxd2MBno=;
        b=eOpTfdOfTNjv4j8LtKw4MNMfRgnf2d2PfNmgAGBcp9hy86oZgkGalRwMJsctEQATx5
         opjEaiS1HxuRLuQu+SFruzRdE/9paW5I/KAaXRbSWyfvJ2XdnD9Siqmq0cC5sPs317Ux
         ez630wy8BvFfzY+ROQdKvKyl4DZg7sP5XYvmzw80LYAki6pseJqKNNg0Xedn4SBJgSSa
         fOlXMYgBhzC3zzUgaLPnFiZqEh3du9m5katYY6mtE/CCK8q0tSIygRowl645KuA6zKmw
         4Qc15+k8F9mdrJUTjP0/FoJWdQU1KBGWWx0UnFeaqs6IQh1Ft5gw7Fjj5wu1Dvb7AHxv
         fo7g==
X-Forwarded-Encrypted: i=1; AFNElJ8j2hqnO/zF18JRiTBNX+qmL/UisMcO4trlyMSrJvYfY+uAlY1q4Fm0B35OESzJGMTUmIK7mDsBjz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ILCoZG2b3VVJ4fsTOmUtq0gfwCzJjqMBgtDAr8KV6q4lK75q
	OoRH1/jhnk5Dtzws498wgHqzaOM0bYozpqliTQcX7MNRf0QYLPqm0fqcMHviUizf54UGpljs8nz
	ZlPY=
X-Gm-Gg: Acq92OFajg6TiTxek9DRZDIx3mKw10JkHQYmIi3LwCFZuQ9vOIkzcEdfCc6acTBCdET
	PJWH4KrJQlWnI/JZrLaAgs3Ma6XKTgVJ2InsqJAgyftjwKce3S3AHOezYcErATjuQNhOJbPCJ9K
	LU6xT8Bii25sL5ioqox5JMXijrNnm9xICDAyLHoYlZkOk+DTijDE/1captAQFHqP5smxT/qh6QS
	sb2M1jrV+fnMHyOIs0zlAr8QlfAmJ0GIarWG4z4vN4UpwR7CdZQRf1NZPmJ4iV7quati51+O8u7
	Vdarv60tW1Iywcne0xWOVo/Qs9t6/+skPE214Vi1E9ER8bgAB/A7ouIUFPOnZGxpqQF04KrYB6H
	y94ryXGogrUhnhF1+7UJWTuDQy4Kxumaqwa1iqq+XWA5UFIcVsBW6kev+3EmncP6qHJFchp/369
	CMHD/OiIrn1OsAumsmcUqws6ZEVVO0pPXIy+FcNRYichGY9l44DNX1qpRG5CuHkuU=
X-Received: by 2002:a17:903:4b30:b0:2bd:646b:2ddc with SMTP id d9443c01a7336-2bea32fa53cmr12402805ad.12.1779339686016;
        Wed, 20 May 2026 22:01:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:9e89:7571:583c:e885])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm242838115ad.49.2026.05.20.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:01:25 -0700 (PDT)
Date: Thu, 21 May 2026 14:01:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec: ucsi: Check if power role change
 actually happened before handling
Message-ID: <ag6LPTDYc3p-hmOV@google.com>
References: <20260519-ucsi-fix-2-v1-0-6f1239535187@qtmlabs.xyz>
 <20260519-ucsi-fix-2-v1-1-6f1239535187@qtmlabs.xyz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ucsi-fix-2-v1-1-6f1239535187@qtmlabs.xyz>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37814-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:url,chromium.org:email,chromium.org:dkim,qtmlabs.xyz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5DA2959EECE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On (26/05/19 18:41), Myrrh Periwinkle wrote:
> The CrOS EC may send a connector status change event with the power
> direction changed flag set even if the power direction hasn't actually
> changed after initiating a SET_PDR command internally [1]. In practice
> this happens on every system suspend due to other changes performed by
> the EC [2][3][4], causing suspend to fail.
> 
> Fix this by checking if the power role change actually happened before
> handling it.
> 
> [1]: https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/zephyr/subsys/pd_controller/pdc_power_mgmt.c;l=1689;drc=2d5a1cffce4e5ac8a39442cb3b764d2d5e1cf794
> [2]: https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/zephyr/subsys/pd_controller/pdc_power_mgmt.c;l=3923;drc=2d5a1cffce4e5ac8a39442cb3b764d2d5e1cf794
> [3]: https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/zephyr/subsys/pd_controller/pdc_power_mgmt.c;l=5094;drc=2d5a1cffce4e5ac8a39442cb3b764d2d5e1cf794
> [4]: https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/zephyr/subsys/pd_controller/pdc_power_mgmt.c;l=2229;drc=2d5a1cffce4e5ac8a39442cb3b764d2d5e1cf794
> 
> Cc: stable@vger.kernel.org
> Fixes: 7616f006db07 ("usb: typec: ucsi: Update power_supply on power role change")
> Signed-off-by: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>

Reported-and-tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

