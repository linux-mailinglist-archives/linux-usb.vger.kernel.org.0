Return-Path: <linux-usb+bounces-34781-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nQiHC1L2tGkHvAAAu9opvQ
	(envelope-from <linux-usb+bounces-34781-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 06:46:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CEB28BD1A
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 06:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7004030530DD
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 05:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96698248F57;
	Sat, 14 Mar 2026 05:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="raIGM/dy"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster5-host1-snip4-2.eps.apple.com [57.103.79.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A6175A9C
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 05:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773467213; cv=none; b=NngeXH2IHFkv0tFRWlp5zLAdBH7Vg5Eo2OzrzkOZLdJ0kUiDCKsQt1aougyK8agss24mSYenLaW9hHaOpBFASr3L/9+jG7HLxM5rS5ExOpHsYgu1F+WBRWzgFgV7RIv7/Q9H3H+tUkTPOslG7eZKp7kQ8nn4J6qH9epq1jjF14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773467213; c=relaxed/simple;
	bh=VEuwbq9TIo11WjxC3hoD5q7zL4QTg2pfPBjzOCy9Y90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbIFfctV7e33HSmYF62ZN1IqHfocXUND/uvjUiR78W6cq9ANmWsUAjvQrP8bqwc7eU3uHqVMrDJMPLPX0Ma/eIZ68lNHrgQhpcMsihdksWMxggFFK0V4dl23XY13ua3dDTePuZSUVIxaNaOMC9AhI+YUhhLEB7PyyrEp3oyT03Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=raIGM/dy; arc=none smtp.client-ip=57.103.79.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-3 (Postfix) with ESMTPS id AFCD518000B0;
	Sat, 14 Mar 2026 05:46:49 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1773467211; x=1776059211; bh=pyYULN/hrkoaF/VfHRNTDL3Ycbnd1NHOv3RuGCvDpj0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=raIGM/dynVkJpBN8SewuDAGqgJMTFMRgnuikAi+Rjvc45e5VuR3HhmNjkUuV7dlEwvJhRnJU9R6eHVUFEjvAosUcW7zNMv3fiBUVCTG+i9u5kh7/RGeOeiWFNtcnf/IJD8D88xiHKggiDvRTLcN8ODl8YpORdCg8OWVO3Hdp9JvxETVRmgC6ujGjEUejeR72x9atxZr7pz/Exjbr7hsUAXrs9PCAlq2m7PFUUE/GaIaxDiyWWAOErREsa+MooGMzV6vKErLqpZZHhkZXWZY1f9yxrmHJTMJOj4mPpMTydFrukkS4EAHUJb80lsS1gxDg9jdh3dxX/ZhPQlNsaA+Ocg==
Received: from bimmer.. (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-3 (Postfix) with ESMTPSA id 5A597180009D;
	Sat, 14 Mar 2026 05:46:48 +0000 (UTC)
From: tobgaertner <tob.gaertner@me.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: kuba@kernel.org,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	bjorn@mork.no,
	tobgaertner <tob.gaertner@me.com>
Subject: [PATCH v3 0/2] net: usb: cdc_ncm: add ndpoffset to NDP nframes bounds check
Date: Fri, 13 Mar 2026 22:46:38 -0700
Message-ID: <20260314054640.2895026-1-tob.gaertner@me.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOSBTYWx0ZWRfXz2r286AUBCRX
 PVv2+njhp4G5MiRG10OXE2m/DKqg0nm8Q4DKhx4JtrGrtTEFFWdbY2o7kawhuBk7adu9vZw2HMd
 R0N2AXXIPHUra9REQDIS6386tgDNOFrLWZD9YpA6bsV4/lykwzmNjxvLAGidIieQvqSKSQPhi9k
 Bz4LuhHhCfs5APDg9aGG0BRT2Sc2A11TWaib7K8+yyZylJH1t3Fonb5HUI0U0GJomfXCZW9afyJ
 +mn0q/fVfNB2/nJtBLOTctD2X/TFqQonKXicNVkPyloNJkeIT2Qimh7mDLEQsgQmz0hH9agX7z3
 sauuDZFHlWGRa5xShFzW2a3qx/TXD/PTw7bgKanrfBrLSStC5flPZW30QcjZjE=
X-Authority-Info-Out: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69b4f64a
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=Yq5XynenixoA:10 a=x7bEGLp0ZPQA:10
 a=C3-SEi6G3EkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=vawl1ekDSUxKlQN4UPUA:9
 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: kA4TB7c7dj5xI1zcga3AqvePS88qxD0Q
X-Proofpoint-GUID: kA4TB7c7dj5xI1zcga3AqvePS88qxD0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=553 mlxscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603140039
X-JNJ: AAAAAAABqd9ak1X4Z2eAvbMcPe/IrTUYC6uM6q/PZbdEssFPcrVpNZ23heFH+tqitYkbuOz1mqSbZsjeBTYe6V8o96t7cmwTJthz41onAyE9T40GK1vurBLWwEBJjKND141zV7IekkGsOIH8PEE+zzQWIW0K5GstqIjxUlqLzsnzVTOTa0m5v9fDsjG0eYL0En7k4Knd4f4tcOBeOrm0csyl4ckr4sHa7WAHIX7qMFCioRrEZwmOptys7DI1TiAE5tVbBG04cKdLpIKFk8BE8KsxjWFPrFMHTLOh+GIrMxqdHqhiZEUJDQYBDB+VHmbLZ1oVHb9R+9olpqO8n7L88mmEMF/Tm2SagVprSSXmGJ20vfgvc2a6ePC1HH0NAajddBF+tfe0dG5cYRR+zBSZYyNsetZFQXPIb57nzrUI3u5MWR29emQOXjooXRR2KVBbaTwnJ4Rg6ViH0rMuJ7W45q/3boR1mU6HzVP1BtARA60Ya5j5rAcp8AHcTfGFj18LG91cu3UheT06S4Mg85bWjKMiG0+GBWov4FU5ut1f/UPc/vCNcyZXm2wmLz3ww53xPCl9WrXaCB2F9G/JZFFzPdYLZuXTAIgMmzNXJcQ+WQFr9G+oPnz9e6y8Yhrdmpc2wvN7iG8n3KvI4SrWW7N2ogMAF/9HsGRu0feR4l7Ha46e8l+A/TaRsgDOvRE9zXM8qRODORFgqoTy+w==
X-Apple-Category-Label: Mjg5MDYwMTc4OiRjYXRlZ29yeSRfUGVyc29uYWws
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[me.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[me.com:s=1a1hai];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,suse.com,mork.no,me.com];
	TAGGED_FROM(0.00)[bounces-34781-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tob.gaertner@me.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[me.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[me.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[me.com:dkim,me.com:mid]
X-Rspamd-Queue-Id: A2CEB28BD1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The nframes bounds check in cdc_ncm_rx_verify_ndp16() and
cdc_ncm_rx_verify_ndp32() does not account for ndpoffset,
allowing out-of-bounds reads when the NDP is placed near the
end of the NTB.

Changes since v2:
- Save struct_size_t() result to a temp variable to avoid
  awkward line wrapping (Jakub)
- Fix From/Signed-off-by mismatch
- Move "Compile-tested only" out of the Signed-off-by line
  into the commit message body

Tobi Gaertner (2):
  net: usb: cdc_ncm: add ndpoffset to NDP16 nframes bounds check
  net: usb: cdc_ncm: add ndpoffset to NDP32 nframes bounds check

 drivers/net/usb/cdc_ncm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.43.0


