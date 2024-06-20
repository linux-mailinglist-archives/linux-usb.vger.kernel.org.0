Return-Path: <linux-usb+bounces-11483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E193091063B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 15:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 946331F262C9
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE271AF695;
	Thu, 20 Jun 2024 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GyESTg1E"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC31AE098
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890304; cv=none; b=vE28JT/kaRhfQZH8qTbTtlcwWPOj9jYzY1RuLV9fdHEcdpj6IDNy9HipmsUjSSlz2fagK7OmGYAllyM3MXS2PtR0rG0xhX2eJ2lV/dLRAw0Jb+fjIcjNuPeHNVWR1ThQY0EQ8fP+PZ2jVwtc6gqJOq+YKaYLOXFfKkKxJVa+Hvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890304; c=relaxed/simple;
	bh=ppX6VBx7+1zsn2VbQNl3tkDpaOj+UZLirFEMqA8idfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WchTGuo+G4heADszC2/t4RrnfIgL8kkae9TDqKotirVHgjTskE6Q4GElWnHOPq3FaRtyyfjrGhyGi+wi2zef8S3zn+BdwjFXqRz436yJZSblYXgZLIYuBvxSv9L/lYUgCSYaDDLZHCTP9Nk8RPqLaoWP4fZPEmdhyNdH8TiC6rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GyESTg1E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718890302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vE+mxyg8YyUZt5GQS1+ElW8LtSozIu63aF5ZDw92HPo=;
	b=GyESTg1EdheZk87D1nv1eq1j/MKV6eDDx/CSeWG+zLL0pys8LhipdeTyN06oWdX0RFEsdZ
	DjI26nqRAKqcnV01dURFcFC/Aukfq65WSjuBtZsOoZhjF0gf9tYrlv4UTR1nVkDiuynHgo
	QOnpKhubPatZOAoF4CL+JY4uhsDFhrk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-mEWm_jU-PZ-8LL1KS58Nvw-1; Thu,
 20 Jun 2024 09:31:37 -0400
X-MC-Unique: mEWm_jU-PZ-8LL1KS58Nvw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 229C01955D68;
	Thu, 20 Jun 2024 13:31:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.104])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3988E1956087;
	Thu, 20 Jun 2024 13:31:25 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: pabeni@redhat.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] net: usb: ax88179_178a: improve link status logs
Date: Thu, 20 Jun 2024 15:31:20 +0200
Message-ID: <20240620133124.102154-1-jtornosm@redhat.com>
In-Reply-To: <c76d1786c308aeb6e4c836334084e3049c0f108a.camel@redhat.com>
References: <c76d1786c308aeb6e4c836334084e3049c0f108a.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hello Paolo,

> Please always include the target tree in the subj prefix - in this case
> it should have been 'net'.
Ok, I forgot it.

> Here                                ^^^^ link value is always 0, so you
> should using a constant string.
Ok, better in that way.

I will send a next version of the patch.

Thanks

Best regards
José Ignacio


