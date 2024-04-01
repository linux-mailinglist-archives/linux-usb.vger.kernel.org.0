Return-Path: <linux-usb+bounces-8690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13C8938CE
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 10:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AFBF1C20FAA
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 08:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C15D51B;
	Mon,  1 Apr 2024 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GlO/Lpo4"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F30D510
	for <linux-usb@vger.kernel.org>; Mon,  1 Apr 2024 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711958811; cv=none; b=sQPhhioE/W8bLrbVRVvgZHm1oyUj0pt0xKPoNtyCvp37WLA8MlusrQQwDeyj4Qb9Vnnk5uWL0Z+fdtFe7rx6e8WFHwymMfl6BQG5gma9aRcedibPI6igbLaahr374CUCrUYhGl2MgcTPvUPvY3R3baviEmsKgYaYoV3QumaF6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711958811; c=relaxed/simple;
	bh=8UebOuTJBhPPkYw51jyujYO9dmpHZI0JM4BT9ioA+NE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6fk/WRpHSLsCk95yO8jwG99UiK18w2RBIlTArVgB31EhecVVdDchQj3E+LA6bBfOgjxAFKEHtM5ZHUEQhxgVLuf7lp18P3wDJZ2KAswwtTk04HtK+1kRjMsvG/q1J7ogli+Pj6eayU+UZAJEXitOftR4C+Y3XTy+32sb3aJN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GlO/Lpo4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711958808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UebOuTJBhPPkYw51jyujYO9dmpHZI0JM4BT9ioA+NE=;
	b=GlO/Lpo4myYEBvuRqoORPY6L31ky+nN5MHR36IJNcb3AqZfurW0RKWtqzfYjzzLho2od64
	2y5fgUbchi4PmThoxUYJ7GmMUVi6Or13hKruUP2sru0qJyuNGCq5nDwpgjQDx7+wQVyb3m
	DY0qtnXkNPBV0OfX3dmkz/leb2JBXsg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-pUqHvB_DNi2mQ8J8yUxjWg-1; Mon, 01 Apr 2024 04:06:45 -0400
X-MC-Unique: pUqHvB_DNi2mQ8J8yUxjWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F70851784;
	Mon,  1 Apr 2024 08:06:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B4C03C21;
	Mon,  1 Apr 2024 08:06:41 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: horms@kernel.org
Cc: dave.stevenson@raspberrypi.com,
	davem@davemloft.net,
	edumazet@google.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] net: usb: ax88179_178a: non necessary second random mac address
Date: Mon,  1 Apr 2024 10:06:19 +0200
Message-ID: <20240401080620.7092-1-jtornosm@redhat.com>
In-Reply-To: <20240327160052.GP403975@kernel.org>
References: <20240327160052.GP403975@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Hello Simon,

Returning after Easter.

I'm sorry I didn't understand you, I have to learn more about the procedure.
I hope to do it better now.

Thanks for your help

Best regards
José Ignacio


