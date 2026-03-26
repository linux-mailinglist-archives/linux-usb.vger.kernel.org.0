Return-Path: <linux-usb+bounces-35477-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPr3Iy+fxGki1gQAu9opvQ
	(envelope-from <linux-usb+bounces-35477-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 03:51:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B032E823
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 03:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1644530305C9
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 02:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C032F5A34;
	Thu, 26 Mar 2026 02:45:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8127AC31;
	Thu, 26 Mar 2026 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493131; cv=none; b=VEIl2WrxmV1+IfoRqvgS0tbGAdTMvMRABI4TAtwvQnlkimV9rfl+k+KF2nnPIRL5zTrpiqgkysCV9Iqxo/89mr0lwpF9+n/w5OgNtEzm7S+5wOAnjkT7gLSBF5EgE3TIxMvN1izgmRs4w51kjEyA2ZdpuAqegAzlNfpSZG1WZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493131; c=relaxed/simple;
	bh=5CofdeBSdWLEHJd0ic5lmvqnvIiOZ2i2TFX0A38XS0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bd9Bs83aU9YK1ARiYzqwww8AUXknzEJ853PiTg3Skv4MAwOm8M986KxzWCq3pisku20bOlaOvaalYmfYIeMGlpaE0iAnYx8PBdhv+7wDlmElAu9D1jLl6oVS6NdTWrdqSRvP+BeLKC8LNbLNj1KRSzu7K9R9n64hk4lAZvftmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d1e181f628bd11f1a21c59e7364eecb8-20260326
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f7d77dbf-a160-460b-a0a4-98cbe3e903f1,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-20
X-CID-INFO: VERSION:1.3.11,REQID:f7d77dbf-a160-460b-a0a4-98cbe3e903f1,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:89c9d04,CLOUDID:9590ebffd80430141cc76175126f18a3,BulkI
	D:260326104516GTZQRLGY,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|898
	,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d1e181f628bd11f1a21c59e7364eecb8-20260326
X-User: aichao@kylinos.cn
Received: from thinksys.. [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 188979020; Thu, 26 Mar 2026 10:45:16 +0800
From: Ai Chao <aichao@kylinos.cn>
To: gregkh@linuxfoundation.org,
	b-liu@ti.com,
	johan@kernel.org,
	badhri@google.com,
	heikki.krogerus@linux.intel.com,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	tiwai@suse.de,
	kees@kernel.org,
	christophe.jaillet@wanadoo.fr,
	prashanth.k@oss.qualcomm.com,
	khtsai@google.com,
	dan.carpenter@linaro.org,
	tglx@kernel.org,
	mingo@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aichao@kylinos.cn
Subject: Test report for [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of strcpy()
Date: Thu, 26 Mar 2026 10:45:06 +0800
Message-Id: <20260326024506.3138744-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35477-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[aichao@kylinos.cn,linux-usb@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pc:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Queue-Id: E79B032E823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Shuah:

Environment:
Kernel Version: v6.12.76+ (with patch applied)
Hardware/QEMU: Thinkpad E15
Userspace Tools: usbip-utils 2.0
Config: CONFIG_USBIP_VHCI_HCD=m
Test Cases Executed:
Build Test: Compiled successfully  , no sparse warnings.
Basic Functionality: Successfully /sys/bus/platform/drivers/vhci_hcd/vhci_hcd.0/status
Stress Test: N/A
Error Handling:  N/A
Attached dmesg log showing successful enumeration and clean teardown.
[  118.736416] usbcore: registered new device driver usbip-host
[  128.833296] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[  128.833354] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 5
[  128.833361] vhci_hcd: created sysfs vhci_hcd.0
[  128.833381] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.12
[  128.833383] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  128.833384] usb usb5: Product: USB/IP Virtual Host Controller
[  128.833385] usb usb5: Manufacturer: Linux 6.12.76+ vhci_hcd
[  128.833386] usb usb5: SerialNumber: vhci_hcd.0
[  128.833449] hub 5-0:1.0: USB hub found
[  128.833454] hub 5-0:1.0: 8 ports detected
[  128.833569] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[  128.833601] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 6
[  128.833613] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[  128.833622] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.12
[  128.833624] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  128.833625] usb usb6: Product: USB/IP Virtual Host Controller
[  128.833626] usb usb6: Manufacturer: Linux 6.12.76+ vhci_hcd
[  128.833626] usb usb6: SerialNumber: vhci_hcd.0
[  128.833687] hub 6-0:1.0: USB hub found
[  128.833691] hub 6-0:1.0: 8 ports detected

(Optional) Attached kmemleak output showing no leaks.
Code:
#define MAX_STATUS_NAME 16

struct status_attr {
        struct device_attribute attr;
        char name[MAX_STATUS_NAME+1];
};
static struct status_attr *status_attrs;
struct status_attr *status;

First:
strcpy(status->name, "status");
strscpy(status->name, "status");

aichao@PC:vhci_hcd.0$ cat status 
hub port sta spd dev      sockfd local_busid
hs  0000 004 000 00000000 000000 0-0
... ...
ss  0015 004 000 00000000 000000 0-0

Second:
strcpy(status->name, "status-abcdefghijklmnopqrstuvwxyz1234567890");

aichao@PC:vhci_hcd.0$ cat status-abcdefghijklmnopqrstuvwxyz1234567890 
hub port sta spd dev      sockfd local_busid
hs  0000 004 000 00000000 000000 0-0
... ...
ss  0015 004 000 00000000 000000 0-0

Third:
strscpy(status->name, "status-abcdefghijklmnopqrstuvwxyz1234567890");
aichao@PC:vhci_hcd.0$ cat status-abcdefghi 
hub port sta spd dev      sockfd local_busid
hs  0000 004 000 00000000 000000 0-0
... ...
ss  0015 004 000 00000000 000000 0-0

Conclusion:
The longth of the name is MAX_STATUS_NAME+1  = 17, used the strcpy copy "status-abcdefghijklmnopqrstuvwxyz1234567890" in name and used strscpy copy "status-abcdefghi" in name.
Tested-by: Aichao@kylinos.cn

thanks.
--

