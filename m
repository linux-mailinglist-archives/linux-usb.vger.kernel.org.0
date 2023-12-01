Return-Path: <linux-usb+bounces-3535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791F8008D0
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 11:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E02E2815C9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04463210E4;
	Fri,  1 Dec 2023 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1bYxslk"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE5010E2
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701427583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NA57GVpcAlUrYRXA0xtGWCe36ignqDZBMAU0zkJLz4=;
	b=D1bYxslkim+C+JtydaPOl/Z/GzaCAcmMUTvd8tSOT9A8D7oZJL5P07ospyVSDugRII3qNd
	AmuZO5J/Ok4yV+/OVW6dS/z77RDQ7trlzEmGS5gDYRRGk9vTGm+s107a4nENMe37XiffS0
	V44p/998odCH6mL4ZK2nhPHh653DD1g=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-bWjaQz9HPTCrFgStonuXtQ-1; Fri,
 01 Dec 2023 05:46:20 -0500
X-MC-Unique: bWjaQz9HPTCrFgStonuXtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AD7C3C0C127;
	Fri,  1 Dec 2023 10:46:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12C8E10E46;
	Fri,  1 Dec 2023 10:46:16 +0000 (UTC)
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
Date: Fri,  1 Dec 2023 11:46:14 +0100
Message-ID: <20231201104615.173933-1-jtornosm@redhat.com>
In-Reply-To: <e8e4ac26-9168-452c-80bc-f32904808cc9@rowland.harvard.edu>
References: <e8e4ac26-9168-452c-80bc-f32904808cc9@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi Alan,

Thank you for your help.
    
> Another possibility would be to have the unbind routine set a flag in
> the private data structure, and then make the ax88179_write_cmd() and
> ax88179_read_cmd() routines avoid printing error messages if the flag is
> set.  Or don't bother with the flag, and simply make the routines skip
> printing an error message if a transfer fails with error code -ENODEV.

Yes, I had thought about those possibilities and I think they are the only
ones from the driver. As you are commenting as well, I will try a second
version with that.

Best regards
José Ignacio


