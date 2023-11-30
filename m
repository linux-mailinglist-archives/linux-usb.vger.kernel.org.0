Return-Path: <linux-usb+bounces-3515-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC97FF825
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 18:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D57EB2119B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 17:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B88756759;
	Thu, 30 Nov 2023 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2kBGNHZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2E9170F
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 09:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701365132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3+asrSFrGo9UuOPMpB+FykgEmlyfPD8k1SOx9pGWoI=;
	b=U2kBGNHZaZIZxQ/ewZvI5rCiX5u9kLy6Pl5s5arKMo3cjaGy7iv9+maLDrUwgkoMGCJhGX
	1XA1eayKeEkqvlaZ0HtW6T+tRrfh+WzJFhVM0VRzLBNCUrTLuWvq3m9xKy7p1jyvyKYV5g
	X28IGsNQyUDBxqnidJOJBZ1860lMYyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-hZEARIXePO-JRq5KGeOjXA-1; Thu, 30 Nov 2023 12:25:29 -0500
X-MC-Unique: hZEARIXePO-JRq5KGeOjXA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31FE8101A53B;
	Thu, 30 Nov 2023 17:25:29 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD270492BFC;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: stern@rowland.harvard.edu
Cc: davem@davemloft.net,
	edumazet@google.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	oneukum@suse.com,
	pabeni@redhat.com
Subject: Re: [PATCH] net: usb: ax88179_178a: avoid failed operations when device is disconnected
Date: Thu, 30 Nov 2023 18:25:21 +0100
Message-ID: <20231130172525.193069-1-jtornosm@redhat.com>
In-Reply-To: <e2faf901-84de-41ad-804d-6c86bc304ef1@rowland.harvard.edu>
References: <e2faf901-84de-41ad-804d-6c86bc304ef1@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Hi Alan,

Thank you again for you comments.

> What are these unnecessary operations?
Sorry if I was not clear, I was referring to the reading and writing 
operations that are commanded within stop and unbind driver functions.
This operations are necessary if we unbind to get the device stopped in
a known state but if the device is detached, they are failing and imho
they are not necessary. That is the reason why I was trying to detect 
when the device is really disconnected, to allow sending commands only
if the device was still connected. 

> In general, drivers should treat "unbind" the same as "disconnect" (in
> both cases, the ->disconnect() routine is called).  If a driver tries to
> send commands to the device while the disconnect routine is running, it
> should expect that they might fail and not generate an error message if
> they do.
>
> (Also, note that the USB core will allow a driver to send commands to
> the device during unbind only if the .soft_unbind flag is set in the
> usb_driver structure.)
>
> And in any case, a driver should _never_ try to communicate with the
> device after the disconnect routine has returned.
Ok, understood, very helpful clarification.
In any case, I was referring to the internal operations during stop and
unbind. And if any failed operations are commanded before and after
disconnection (if any), try to detect with the warning to be sure if there
is any problem.

I have checked that other drivers are using USB_STATE_NOTATTACHED to check
and confirm the device disconnection. And I am trying to analyze other 
drivers to check if this can be done in another way. 
If I use -ENODEV as Oliver suggested, I think I wouldn't know if the device
is disconnected previous to any operation. But maybe this is the way.

Best regards
José Ignacio


