Return-Path: <linux-usb+bounces-34160-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPR9EOQiq2n6aAEAu9opvQ
	(envelope-from <linux-usb+bounces-34160-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 19:54:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7E226DED
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 19:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CE60301371E
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 18:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067EF36C0D3;
	Fri,  6 Mar 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="rEds6i2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163E35B643
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772823258; cv=none; b=h9DSdLnDV2P9xQ/0Dlk99JuJ99+sht9JOKE9wAUBNLiIbqD/8/kUnwOCgT7P8xUKI/RdhPAhOkKOXAeiM+ufkYeeAVFhGV1AROjrlH9a7OLbwsTgAdyr8a8gj2akhlV7OBeUKQkxpLCRe/iuNbQdVOYu9LB6QI8of31v0E06/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772823258; c=relaxed/simple;
	bh=3l6axKbntefNBNgasKFf9eLo6XFZId1HJ0Th4Igut9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qajy5sMv8m2WhxIhrj2F031v6hgk9HadG4S6FiezUFKmVOrptFoRl7JB4BDOpdTNjp9MZ0alA4n+jhCbH7AX9RzBMCLndXo199rdj5If/zpbWtwmLf1KgOxfvRwcej0kTCx97edVeIRig6c6bUS6OCSK83lpfj2sIrS2Dj24Gm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=rEds6i2a; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id yQXgvA760KXDJyaJUvp0gc; Fri, 06 Mar 2026 18:54:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yaJQvwPo6vXvHyaJQvYDpg; Fri, 06 Mar 2026 18:54:12 +0000
X-Authority-Analysis: v=2.4 cv=e4IGSbp/ c=1 sm=1 tr=0 ts=69ab22d7
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=Y9novZUF53J6TEI7N0YA:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N2ZGgiIxstN9ddSFJ9TuTpNAOos5JnaKJWqWEDoDITc=; b=rEds6i2a/eiBoSa86IneISGdXO
	Col85M6u8yZLZIyLkcMJBsNrWLfiVTzk1uVFoyo8I1q6e3aYxsINXHpHtNXrpxXlMyffoI1qyU1ku
	aL0AuuXaAS7iMenxH+DfK3/q/s0dxFYSb+2E083CrzE7QW2tBA4y/zJebFYyf98qCZ1NR5y6+Nve3
	toe9j47d/E+DnY/dTKpaM6O8gYthoI+ZUS/cTZJmjIksWBXwBHq75sG7/vfrOV9a7NczbFwRnItzE
	y31EWEGNKukbkXHm9UvAZaeCh8XF26IAE7UQTFKN+T2TXZuUvtK5s7+erAu0LcTXhI3mw/Gl8ffZc
	lvkcROxw==;
Received: from [177.238.16.13] (port=47446 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyaJP-00000000k3w-2pb9;
	Fri, 06 Mar 2026 12:54:11 -0600
Message-ID: <be17111e-1c78-49ca-8bae-fadcd7af6905@embeddedor.com>
Date: Fri, 6 Mar 2026 12:53:39 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: kzalloc + kcalloc to kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org
Cc: Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260306031639.46942-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260306031639.46942-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vyaJP-00000000k3w-2pb9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:47446
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI/G3XXL4IIDsy16DekSbfzJkmFpRWlv2JKPHvTCjPBjBsO6W9KnUUwFA0gHIa3oQlhpqGRSBEwuSzRA6dteB18OA4Cjshur8Q3DTDy8QfcrA5FPx3Ts
 gwUede7To/O8t0QfSWvPg+ewRSRUuGIYJT7m8NHYKS8O5WiiWE1nbCEtuIa4f9FynPSUsKGmIzAIld4EQfW2342nmHpNYib4ung=
X-Rspamd-Queue-Id: 64C7E226DED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34160-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[embeddedor.com];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[embeddedor.com:-];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_SPAM(0.00)[0.637];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[gustavo@embeddedor.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[embeddedor.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 3/6/26 12:16, Rosen Penev wrote:
> Simplifies allocation and allows using __counted_by for extra runtime
> analysis.

Are you finding these with Coccinelle or any other tool?

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-Gustavo

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 1d2f3af034c5..272f9187b12d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -605,9 +605,9 @@ struct altmode_vdm_event {
>   	struct kthread_work work;
>   	struct tcpm_port *port;
>   	u32 header;
> -	u32 *data;
>   	int cnt;
>   	enum tcpm_transmit_type tx_sop_type;
> +	u32 data[] __counted_by(cnt);
>   };
>   
>   static const char * const pd_rev[] = {
> @@ -1653,7 +1653,6 @@ static void tcpm_queue_vdm_work(struct kthread_work *work)
>   	tcpm_queue_vdm(port, event->header, event->data, event->cnt, event->tx_sop_type);
>   
>   port_unlock:
> -	kfree(event->data);
>   	kfree(event);
>   	mutex_unlock(&port->lock);
>   }
> @@ -1662,35 +1661,27 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>   				   const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
>   {
>   	struct altmode_vdm_event *event;
> -	u32 *data_cpy;
>   	int ret = -ENOMEM;
>   
> -	event = kzalloc_obj(*event);
> +	event = kzalloc_flex(*event, data, cnt);
>   	if (!event)
>   		goto err_event;
>   
> -	data_cpy = kcalloc(cnt, sizeof(u32), GFP_KERNEL);
> -	if (!data_cpy)
> -		goto err_data;
> -
>   	kthread_init_work(&event->work, tcpm_queue_vdm_work);
> +	event->cnt = cnt;
>   	event->port = port;
>   	event->header = header;
> -	memcpy(data_cpy, data, sizeof(u32) * cnt);
> -	event->data = data_cpy;
> -	event->cnt = cnt;
> +	memcpy(event->data, data, sizeof(u32) * cnt);
>   	event->tx_sop_type = tx_sop_type;
>   
>   	ret = kthread_queue_work(port->wq, &event->work);
>   	if (!ret) {
>   		ret = -EBUSY;
> -		goto err_queue;
> +		goto err_data;
>   	}
>   
>   	return 0;
>   
> -err_queue:
> -	kfree(data_cpy);
>   err_data:
>   	kfree(event);
>   err_event:


