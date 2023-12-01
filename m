Return-Path: <linux-usb+bounces-3573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973628011AA
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8EDF1C20951
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 17:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A735E4E1DA;
	Fri,  1 Dec 2023 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmRLT3y+"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590482102
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 09:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701451647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIN6tLPw09H9zOs4zuK0VfA5bwhOPcu5mP00NJGpiN4=;
	b=cmRLT3y+rH6413F5CAoKZbcTwH4wyc79mdAgNR9Ym5OTJokdv87nKVoi8eAl5sSG3NWAMb
	EnZnjikMJm6gGiqO74fpIQIulNiY5PfIQGrHHQLisQz3MpzBGkXtX+Lz+qmF4pgGxCiJhU
	duE8VE6L46euP9HjhGP0imWPjfq0cf0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-eD3LDQIjMwmrsUndj-JnrQ-1; Fri,
 01 Dec 2023 12:27:19 -0500
X-MC-Unique: eD3LDQIjMwmrsUndj-JnrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4735B3804528;
	Fri,  1 Dec 2023 17:27:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 362E22026D4C;
	Fri,  1 Dec 2023 17:27:17 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: stern@rowland.harvard.edu
Cc: davem@davemloft.net,
	edumazet@google.com,
	greg@kroah.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	oneukum@suse.com,
	pabeni@redhat.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] net: usb: ax88179_178a: avoid failed operations when device is disconnected
Date: Fri,  1 Dec 2023 18:27:14 +0100
Message-ID: <20231201172716.182693-1-jtornosm@redhat.com>
In-Reply-To: <140e912f-8702-4e85-8d6c-ef0255e718f8@rowland.harvard.edu>
References: <140e912f-8702-4e85-8d6c-ef0255e718f8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Hi Alan,

> Would it be good enough just to check for ret != -ENODEV and not do the 
> stopping_unbinding check at all?
I thought about that but if possible, I would like to ignore the failed
operation messages only under a controlled and expected situation. 
I think that if there is a problem with the device it will be easier to
analyze it later with all the possible information.
But this is my opinion ...

Thank you

Best regards
José Ignacio


