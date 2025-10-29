Return-Path: <linux-usb+bounces-29856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F0CC1CFC4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 20:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 662C34E4B33
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 19:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4252359F8F;
	Wed, 29 Oct 2025 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYqKLEPt"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75393590A5
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761765342; cv=none; b=Nu+kYHvMSdWiZfBRc98TG9UITTEO/hvqxvH6RwlPA71Z2BZgHLZWR7Bwe33kJ+P80QcccXrtHfwhfWhHxKu3oCARupMVO5+xcYiBndMEB0Yg7cdWohz+aaYtFCkG0wPYhOd9Ndv8v0IJ0Ch3UgwDo8KVL4NNcMQ4shxSlo/wras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761765342; c=relaxed/simple;
	bh=TqH3f9WEsKGIQCGfs98WcvW2L7vbzVkVtP8kpqxfH+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvWeUmcEK0kuw1kk0CIbO9bwqKcmnaSjaX95sCw9x32D7HnbiStzjcit4Da7VRBKuyxJRKC8dwt3ge0WY7qp3lP2mF/V5zBvr4m3kDAQXuvUr+frcxjOoglTosC5IGMRZItptn7znf7fXcuHPLCnSSBq6KRYBp1vevb39DnNFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYqKLEPt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761765339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irHGwX2CAaCHue8ZR+vjyEBK//LHLFJdgkPgg14EHdc=;
	b=bYqKLEPt2WfLc7ZlA8ON619rZhRZ8FEkdcUwxuJzax+0eECuWkgj+4HaJ4j4ZQUtctUGyq
	ziRDH4lGA0gA1fhgtzAUI6EOXE3vYg+wzSSAD1lKFmSIrc7by0919ut71R6y9nYc6YtHhy
	x5NUgRbX4lXievFbZ4wQMkBu5Vm8hTQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-434-c3zU7WcZPxeJ12sJ1VWEBw-1; Wed,
 29 Oct 2025 15:15:36 -0400
X-MC-Unique: c3zU7WcZPxeJ12sJ1VWEBw-1
X-Mimecast-MFC-AGG-ID: c3zU7WcZPxeJ12sJ1VWEBw_1761765335
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2EB47180137B;
	Wed, 29 Oct 2025 19:15:35 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.139])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 358ED1955F1B;
	Wed, 29 Oct 2025 19:15:32 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	Desnes Nunes <desnesn@redhat.com>
Subject: [PATCH 2/2] usb: storage: rearrange triple nested CSW data phase check
Date: Wed, 29 Oct 2025 16:14:14 -0300
Message-ID: <20251029191414.410442-3-desnesn@redhat.com>
In-Reply-To: <20251029191414.410442-1-desnesn@redhat.com>
References: <20251029191414.410442-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This rearranges the triple nested CSW data phase if clause, in order to
make usb_stor_Bulk_transport() code more readlable. No functional change.

Signed-off-by: Desnes Nunes <desnesn@redhat.com>
---
 drivers/usb/storage/transport.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 96b81cf6adc7..3f2e1df5ad1e 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -1188,18 +1188,17 @@ int usb_stor_Bulk_transport(struct scsi_cmnd *srb, struct us_data *us)
 		 * check whether it really is a CSW.
 		 */
 		if (result == USB_STOR_XFER_SHORT &&
-				srb->sc_data_direction == DMA_FROM_DEVICE &&
-				transfer_length - scsi_get_resid(srb) ==
-					US_BULK_CS_WRAP_LEN) {
+		    srb->sc_data_direction == DMA_FROM_DEVICE &&
+		    transfer_length - scsi_get_resid(srb) == US_BULK_CS_WRAP_LEN) {
 			struct scatterlist *sg = NULL;
-			unsigned int offset = 0;
-
-			if (usb_stor_access_xfer_buf((unsigned char *) bcs,
-					US_BULK_CS_WRAP_LEN, srb, &sg,
-					&offset, FROM_XFER_BUF) ==
-						US_BULK_CS_WRAP_LEN &&
-					bcs->Signature ==
-						cpu_to_le32(US_BULK_CS_SIGN)) {
+			unsigned int offset = 0, buflen = 0;
+
+			buflen = usb_stor_access_xfer_buf((unsigned char *) bcs,
+						US_BULK_CS_WRAP_LEN, srb, &sg,
+						&offset, FROM_XFER_BUF);
+
+			if (buflen == US_BULK_CS_WRAP_LEN &&
+			    bcs->Signature == cpu_to_le32(US_BULK_CS_SIGN)) {
 				unsigned char buf[US_BULK_CS_WRAP_LEN];
 
 				sg = NULL;
-- 
2.50.1


