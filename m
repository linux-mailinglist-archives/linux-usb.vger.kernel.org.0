Return-Path: <linux-usb+bounces-2928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E76297EE1EB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 14:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D0428109E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289432F3D;
	Thu, 16 Nov 2023 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="adGXIAbZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EEB1BC1
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 05:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700142646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRYUXNkoJkqjfiq94gnRR2tpyfMacneqCdIvg/D2QqA=;
	b=adGXIAbZvcWZtZaiU48L3N0tUciD8x0LfUtahKF7B/H07UgTBwNshPiYa6P703haNGn0IF
	fCL9LjahAke1/GZTlWzgfpzkCnw0czkcbkJ+ofHLUqy7EKiZRXC0PJ27CXsQoQfFN873e8
	YvHXdGjNVu1OXBMZKwuzo9xaZTqfRf8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-A5A73WdPOM-nbQzROePm0Q-1; Thu,
 16 Nov 2023 08:50:42 -0500
X-MC-Unique: A5A73WdPOM-nbQzROePm0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 307223C1476C;
	Thu, 16 Nov 2023 13:50:40 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB6B31C060AE;
	Thu, 16 Nov 2023 13:50:36 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: pabeni@redhat.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	weihao.bj@ieisystem.com
Subject: Re: [PATCH 1/2] net: usb: ax88179_178a: fix failed operations during ax88179_reset
Date: Thu, 16 Nov 2023 14:50:33 +0100
Message-ID: <20231116135035.21504-1-jtornosm@redhat.com>
In-Reply-To: <d17b696c81a57fb857b54a8c05e121be1cfc47fa.camel@redhat.com>
References: <d17b696c81a57fb857b54a8c05e121be1cfc47fa.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On Thu, Nov 16, 2023 at 10:38 AM Paolo Abeni <pabeni@redhat.com> wrote:
> We need at least a suitable Fixes tag
Ok, I will add it in my next version.

> Do you know if there is some status register you can query for 'reset
> completed'? or some official documentation you can quote for the above
> delay?
I have only continued the previous way.
But, you are right, maybe it can be done better, let me try if possible.

Thank you

Best regards
José Ignacio


