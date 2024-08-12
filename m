Return-Path: <linux-usb+bounces-13324-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C761794EA47
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2024 11:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E2A1C209CD
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2024 09:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED4916E882;
	Mon, 12 Aug 2024 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0sMxdaz"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B8A16E863
	for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2024 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456251; cv=none; b=qSFnSOktvSLw5FWLUvSMNdysGtjeEsvUJO9NlxWL77CxuN5wJxxNT3sokUykUHL0iYPhHD5b7YqfsFzSfgMGGri4zsm7RPyPjFz22cD2ySrfGHjmtByxk17ayqoYREumRFxbm51RLz+qEeXp4zZBnYg/X/Sh1AaCwEZXkc0sU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456251; c=relaxed/simple;
	bh=0WaK9OXdNBMoP+JTKNLy2Um3n5MlxUMovt1OQQZxQSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzwDgFJLegupxdboq5ZCun5vU9zY73TRVihw5/FtVI186aP92IGyyZzZz2B+8XUmBC4a0NgVBtM9dM3VK67HDFTKFgZeOl9/I6wv1lFdkry60lAtWPBWrcfFvTF0nCA2aWvZ2/O65YJb51nSnXDRpZqojU0J8DaKn4w3eykM+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0sMxdaz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723456248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vi0RNgNNNzMSSmMxUnz4oPbIAlS8Wvekijn9vf9qR2o=;
	b=H0sMxdazxi3jzAvhQbVjpAZR/u91cRjZc0uFUlNOQyEx4Gw9tQ5n3GiQqfA3EYyVF3GoUv
	AYN4ixCbi9HrqPMmTPBTNvYcCIorMRYWWwLx2oyVSiAoLnmS0Ejil8YB5ILFVZOO/dA/1x
	OiL4miRZFGC5tthZWonlKhQMengSAXE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-YdE0OOh4M1mbpREC4dWcmA-1; Mon,
 12 Aug 2024 05:50:42 -0400
X-MC-Unique: YdE0OOh4M1mbpREC4dWcmA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92FB918EA946;
	Mon, 12 Aug 2024 09:50:41 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.172])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6D0419560A3;
	Mon, 12 Aug 2024 09:50:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wentong Wu <wentong.wu@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: misc: ljca: Add Lunar Lake ljca GPIO HID to ljca_gpio_hids[]
Date: Mon, 12 Aug 2024 11:50:38 +0200
Message-ID: <20240812095038.555837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Add LJCA GPIO support for the Lunar Lake platform.

New HID taken from out of tree ivsc-driver git repo.

Link: https://github.com/intel/ivsc-driver/commit/47e7c4a446c8ea8c741ff5a32fa7b19f9e6fd47e
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/misc/usb-ljca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 2d30fc1be306..1a8d5e80b9ae 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -169,6 +169,7 @@ static const struct acpi_device_id ljca_gpio_hids[] = {
 	{ "INTC1096" },
 	{ "INTC100B" },
 	{ "INTC10D1" },
+	{ "INTC10B5" },
 	{},
 };
 
-- 
2.46.0


