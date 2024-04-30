Return-Path: <linux-usb+bounces-9936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AA8B6C84
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 10:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BD9E1C222D9
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 08:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3493548FC;
	Tue, 30 Apr 2024 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1fxNCho"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E94594D
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714464646; cv=none; b=fkAc79mZIxOzgyVl90yv0tZIjkUYY5I7uHOza6wJSLfDPy9InW2LkS2koWLnuWpFgXND/f4FwzDgXEjj0BlUYzaCVFdLKztOdz7Jr970iSvZp5n2ubbDHSit2Scjs3z5vWMC0V0qfnwBcviaikUquGAw8QmK1ANLnBqvgTc8An0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714464646; c=relaxed/simple;
	bh=38D/E0QynX5t/3/hbHIk50M6Sl+epAu87XCK1LhciKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/rJm31oehWn3U5tspW7LRlK9fSX+JfC8qbtINuX9cGVPjb31TBIVWK8xGwVoUlq8F/ZPGRsN6jHp82rfB65g0Dn/bj7bHataRf/yd94Bj5XcjUx7IQapsSH/4jNY8AJZV2oy3zK4kTnB/lBcBuWakINnTGxN4s3yfkZ2P9Ifhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1fxNCho; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714464643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SGk41959AnFc6RykN6nKaUpg5RkxwVWglWv+3boUFro=;
	b=A1fxNChoY/esoD1mwDjVpvd9NlBCGwY7LKnzed4mD979ne1Fa2XifeeV4H1aFLCSM/SIIy
	H6dJlBxyMAUCPQrRmaY7lKSEj1juPVptrPGXJPeRHSkqvc0+wMekKvadE/vFcUpaYTxpgO
	en7qPnpqvEQpycVNNw5FaOhV2a59H+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-v7N2sKfFPZOeRadi5U3lhg-1; Tue, 30 Apr 2024 04:10:38 -0400
X-MC-Unique: v7N2sKfFPZOeRadi5U3lhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7C73834FBF;
	Tue, 30 Apr 2024 08:10:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8588F200AFA2;
	Tue, 30 Apr 2024 08:10:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9F81E180099B; Tue, 30 Apr 2024 10:10:35 +0200 (CEST)
Date: Tue, 30 Apr 2024 10:10:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v3] usb: ohci: Prevent missed ohci interrupts
Message-ID: <723ahlmaul2l2mpqfdykufwz5lyyvhhehbpx5ya6eopquq6mro@qo6h2wnbqm36>
References: <20240429154010.1507366-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429154010.1507366-1-linux@roeck-us.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On Mon, Apr 29, 2024 at 08:40:10AM GMT, Guenter Roeck wrote:
> Testing ohci functionality with qemu's pci-ohci emulation often results
> in ohci interface stalls, resulting in hung task timeouts.
> 
> The problem is caused by lost interrupts between the emulation and the
> Linux kernel code. Additional interrupts raised while the ohci interrupt
> handler in Linux is running and before the handler clears the interrupt
> status are not handled. The fix for a similar problem in ehci suggests
> that the problem is likely caused by edge-triggered MSI interrupts. See
> commit 0b60557230ad ("usb: ehci: Prevent missed ehci interrupts with
> edge-triggered MSI") for details.
> 
> Ensure that the ohci interrupt code handles all pending interrupts before
> returning to solve the problem.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: David Laight <David.Laight@aculab.com>
> Cc: stable@vger.kernel.org
> Fixes: 306c54d0edb6 ("usb: hcd: Try MSI interrupts on PCI devices")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Check if any interrupts are pending before reading intrenable
>     Add 'Cc: stable@vger.kernel.org'
> v2: Only repeat if the interface is still active

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


