Return-Path: <linux-usb+bounces-2877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230087EB03C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 13:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52C7B1C20A46
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1FE3FB24;
	Tue, 14 Nov 2023 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5oXhiW0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066F3FB0A
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 12:51:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70368196
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 04:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699966315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ebvZe4TIPBxRze+Pu3P24AV1eNd9MQIB23VhEMldQz0=;
	b=K5oXhiW0jY4DNgWSYry5ecGt+8hCOUtbyNwRyMdL3GO+5IR1TCxJfBSfPAdviriuHiwm0a
	Fxy1xRNP108E4yf1MF5qZ4NYVou/IWjZk6ZJo5q2GyY8W9iQjB9rxzIG6hCBiRqy7mA1D7
	RKnhcKyaZHIpbZ0dmos97TW1km4nFkE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-Znp_XnGwOXuaeN0YZOHPww-1; Tue,
 14 Nov 2023 07:51:54 -0500
X-MC-Unique: Znp_XnGwOXuaeN0YZOHPww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7C261C05149;
	Tue, 14 Nov 2023 12:51:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3D72026D4C;
	Tue, 14 Nov 2023 12:51:51 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jtornosm@redhat.com,
	weihao.bj@ieisystem.com
Subject: [PATCH 0/2] net: usb: ax88179_178a: fix and improve reset procedure
Date: Tue, 14 Nov 2023 13:50:43 +0100
Message-ID: <20231114125111.313229-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Intensive reset testing has detected some problems that need to be fixed
to get a correct initialization.


