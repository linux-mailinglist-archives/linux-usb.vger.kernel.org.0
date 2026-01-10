Return-Path: <linux-usb+bounces-32128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF5D0D2E3
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 08:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FCBC300CF38
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 07:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074C62E6CBF;
	Sat, 10 Jan 2026 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m/E3g4zI"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB152AEE1;
	Sat, 10 Jan 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768031665; cv=none; b=a5LxK5dIsPhUolIJBTBF+0Z1TxDQjE5Ms5PoDnT512LpL6mKeL2Wkih1kgsbwrUzttle0lmLHbmkIHZxS2JhGXARGkrU5p3n0lJSI/+JoFQzgpRepNXNWPUnkMTDiOyYyc66E95I4fp0xq2s8OJdRPndfOPk6//Q016w4TPLwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768031665; c=relaxed/simple;
	bh=xMk1UStvF3aeKgG78SBE8ng/7Edw5S2Hv1nWRUovlmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcltNMK6RFimPCcFenIcBvjnvhXGHopKvV20Ihh3BObn1w5zAsJHe8JAoHJxKDJhXIBTkmzOeDycn4C6jnY/uMVlvn9msVLTxib8eOU41CZA2ys+g+g9SMoYFTFr5NRBFBwYyqvJyxrpwZT3an+4EUY1EuqruWT34AwO+yie7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m/E3g4zI; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tj
	X2oXdCk+6+6snsqOlEZ+83/82Ro6C20h04M4A5oc0=; b=m/E3g4zI7rRGjNE8dP
	QEFrNQ2e7SYejkaD5t8EBQ3CYFG8Cga4IR6TSegDK0VdMohyVBmX2g6XBytmoQ0h
	MnRgaLKJmzUCeM/1yylMYfid44XbR/4VWXJ+Fxp/Ua5gzxNd5K8NRzR3dyMKbf4N
	R1l67HuXmO6Ni9QizcmdkNiCk=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wA3eBOJBWJpaIyVEw--.14450S2;
	Sat, 10 Jan 2026 15:53:49 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: rdbabiera@google.com
Cc: badhri@google.com,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	andyshrk@163.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/2] usb: typec: altmodes/displayport: do not enter mode if port is the UFP
Date: Sat, 10 Jan 2026 15:53:42 +0800
Message-ID: <20260110075345.238333-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923181606.1583584-6-rdbabiera@google.com>
References: <20250923181606.1583584-6-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3eBOJBWJpaIyVEw--.14450S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFy7AryUKry3urW8ZF4xZwb_yoW3Cw48pF
	WY93Z8Gry7X39xWr42yF1xJayY9FWDJa9ruF9I9w1Sv3WUuF48JFn5K3y8Gry7urW3tFy3
	Xas0gr1jkFWkC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR3xhJUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7g5XtWliBY42AgAA32

>Nothing currently stops the DisplayPort Alt Mode driver from sending
>Enter Mode if the port is the Data Device. Utilize
>typec_altmode_get_data_role to prevent mode entry.

>---
> drivers/usb/typec/altmodes/displayport.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

>diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>index 1dcb77faf85d..8d111ad3b71b 100644
>--- a/drivers/usb/typec/altmodes/displayport.c
>+++ b/drivers/usb/typec/altmodes/displayport.c
>@@ -758,7 +758,9 @@ int dp_altmode_probe(struct typec_altmode *alt)
> 	struct fwnode_handle *fwnode;
> 	struct dp_altmode *dp;
> 
>-	/* FIXME: Port can only be DFP_U. */
>+	/* Port can only be DFP_U. */
>+	if (typec_altmode_get_data_role(alt) != TYPEC_HOST)
>+		return -EPROTO;
> 
> 	/* Make sure we have compatible pin configurations */
> 	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
>
I found that after applying this patch, the Rock 5B SBC can no longer
enter alt mode when connected to a DP monitor via a Type-C hub, the following
error dmesg can be seen:
typec_displayport port0-partner.0: probe with driver typec_displayport failed with error -71

The TypeC Port on rock5b drive via the PD chip FUSB302
# cat /sys/kernel/debug/usb/tcpm-4-0022/log 
[    1.561397] Unable to find pd-revision property or incorrect array size
[    1.590115] Setting usb_comm capable false
[    1.590123] Setting voltage/current limit 0 mV 0 mA
[    1.590129] polarity 0
[    1.590198] Requesting mux state 0, usb-role 0, orientation 0
[    1.631710] state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AMS]
[    1.633129] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
[    1.645221] 4-0022: registered
[    1.646189] Setting usb_comm capable false
[    1.646215] Setting voltage/current limit 0 mV 0 mA
[    1.646231] polarity 0
[    1.646237] Requesting mux state 0, usb-role 0, orientation 0
[    1.662091] cc:=2
[    1.668000] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    1.671183] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[    1.672491] pending state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED @ 920 ms [rev1 NONE_AMS]
[    2.601879] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [delayed 920 ms]
[    2.602431] Start toggling
[    2.624387] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
[    2.626056] state change TOGGLING -> SNK_ATTACH_WAIT [rev1 NONE_AMS]
[    2.629010] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 200 ms [rev1 NONE_AMS]
[    2.830604] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 200 ms]
[    2.831984] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev1 NONE_AMS]
[    2.832941] polarity 1
[    2.832945] Requesting mux state 1, usb-role 2, orientation 2
[    2.860029] state change SNK_ATTACHED -> SNK_STARTUP [rev1 NONE_AMS]
[    2.861402] state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_AMS]
[    2.861945] Setting voltage/current limit 5000 mV 3000 mA
[    2.861950] vbus=0 charge:=1
[    2.862859] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
[    2.869362] pending state change SNK_WAIT_CAPABILITIES -> SNK_SOFT_RESET @ 310 ms [rev3 NONE_AMS]
[    3.181014] state change SNK_WAIT_CAPABILITIES -> SNK_SOFT_RESET [delayed 310 ms]
[    3.181580] AMS SOFT_RESET_AMS start
[    3.183145] state change SNK_SOFT_RESET -> AMS_START [rev3 SOFT_RESET_AMS]
[    3.184513] state change AMS_START -> SOFT_RESET_SEND [rev3 SOFT_RESET_AMS]
[    3.185066] PD TX, header: 0x8d
[    3.193733] PD TX complete, status: 0
[    3.196440] pending state change SOFT_RESET_SEND -> HARD_RESET_SEND @ 60 ms [rev3 SOFT_RESET_AMS]
[    3.198922] PD RX, header: 0x1a3 [1]
[    3.200603] AMS SOFT_RESET_AMS finished
[    3.202836] state change SOFT_RESET_SEND -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
[    3.207907] pending state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILITIES_TIMEOUT @ 310 ms [rev3 NONE_AMS]
[    3.208976] PD RX, header: 0x43a1 [1]
[    3.210464]  PDO 0: type 0, 5000 mV, 2000 mA [RUDE]
[    3.210467]  PDO 1: type 0, 9000 mV, 2450 mA []
[    3.210469]  PDO 2: type 0, 15000 mV, 2670 mA []
[    3.210472]  PDO 3: type 0, 20000 mV, 3000 mA []
[    3.211607] state change SNK_WAIT_CAPABILITIES -> SNK_NEGOTIATE_CAPABILITIES [rev3 POWER_NEGOTIATION]
[    3.213865] Setting usb_comm capable true
[    3.213871] cc=2 cc1=0 cc2=5 vbus=0 vconn=sink polarity=1
[    3.213877] Requesting PDO 3: 20000 mV, 3000 mA
[    3.213880] PD TX, header: 0x1282
[    3.222930] PD TX complete, status: 0
[    3.225674] pending state change SNK_NEGOTIATE_CAPABILITIES -> HARD_RESET_SEND @ 60 ms [rev3 POWER_NEGOTIATION]
[    3.229457] PD RX, header: 0x5a3 [1]
[    3.232125] state change SNK_NEGOTIATE_CAPABILITIES -> SNK_TRANSITION_SINK [rev3 POWER_NEGOTIATION]
[    3.234275] Setting standby current 5000 mV @ 500 mA
[    3.234278] Setting voltage/current limit 5000 mV 500 mA
[    3.235158] pending state change SNK_TRANSITION_SINK -> HARD_RESET_SEND @ 500 ms [rev3 POWER_NEGOTIATION]
[    3.339971] PD RX, header: 0x7a6 [1]
[    3.341738] Setting voltage/current limit 20000 mV 3000 mA
[    3.342566] state change SNK_TRANSITION_SINK -> SNK_READY [rev3 POWER_NEGOTIATION]
[    3.346462] AMS POWER_NEGOTIATION finished
[    3.352068] AMS DISCOVER_IDENTITY start
[    3.354952] PD TX, header: 0x148f
[    3.363951] PD TX complete, status: 0
[    3.372273] PD RX, header: 0x59af [1]
[    3.375213] Rx VDM cmd 0xff00a041 type 1 cmd 1 len 5
[    3.376489] AMS DISCOVER_IDENTITY finished
[    3.378482] Identity: 1d5c:7102.070a
[    3.381145] AMS DISCOVER_SVIDS start
[    3.384002] PD TX, header: 0x168f
[    3.393019] PD TX complete, status: 0
[    3.400228] PD RX, header: 0x2baf [1]
[    3.403143] Rx VDM cmd 0xff00a042 type 1 cmd 2 len 2
[    3.404418] AMS DISCOVER_SVIDS finished
[    3.405753] SVID 1: 0xff01
[    3.408814] AMS DISCOVER_MODES start
[    3.411666] PD TX, header: 0x188f
[    3.420681] PD TX complete, status: 0
[    3.427868] PD RX, header: 0x2daf [1]
[    3.430784] Rx VDM cmd 0xff01a043 type 1 cmd 3 len 2
[    3.432193] AMS DISCOVER_MODES finished
[    3.433811]  Alternate mode 0: SVID 0xff01, VDO 1: 0x00040045
[    3.468873] AMS DFP_TO_UFP_ENTER_MODE start
[    3.473347] PD TX, header: 0x1a8f
[    3.483714] PD TX complete, status: 0
[    3.490564] PD RX, header: 0x1faf [1]
[    3.493540] Rx VDM cmd 0xff01a144 type 1 cmd 4 len 1
[    3.495653] AMS DFP_TO_UFP_ENTER_MODE finished
[    3.501550] AMS STRUCTURED_VDMS start
[    3.504410] PD TX, header: 0x2c8f
[    3.513803] PD TX complete, status: 0
[    3.520991] PD RX, header: 0x21af [1]
[    3.523920] Rx VDM cmd 0xff01a150 type 1 cmd 16 len 2
[    3.526044] AMS STRUCTURED_VDMS finished
[    3.544870] AMS STRUCTURED_VDMS start
[    3.547736] PD TX, header: 0x2e8f
[    3.557132] PD TX complete, status: 0
[    3.564509] PD RX, header: 0x13af [1]
[    3.567452] Rx VDM cmd 0xff01a151 type 1 cmd 17 len 1
[    3.569581] AMS STRUCTURED_VDMS finished
[    6.927982] PD RX, header: 0x25af [1]
[    6.931501] Rx VDM cmd 0xff01a106 type 0 cmd 6 len 2

The flow terminates at this point without continuing into alt mode.

After reverting this patch, the process can continue and successfully enter alt mode:

[    3.159202] AMS DFP_TO_UFP_ENTER_MODE start
[    3.159207] PD TX, header: 0x1a8f
[    3.167022] PD TX complete, status: 0
[    3.171317] PD RX, header: 0x1faf [1]
[    3.171322] Rx VDM cmd 0xff01a144 type 1 cmd 4 len 1
[    3.171327] AMS DFP_TO_UFP_ENTER_MODE finished
[    3.171402] AMS STRUCTURED_VDMS start
[    3.171406] PD TX, header: 0x2c8f
[    3.179592] PD TX complete, status: 0
[    3.184266] PD RX, header: 0x21af [1]
[    3.184271] Rx VDM cmd 0xff01a150 type 1 cmd 16 len 2
[    3.184277] AMS STRUCTURED_VDMS finished
[    3.184315] AMS STRUCTURED_VDMS start
[    3.184319] PD TX, header: 0x2e8f
[    3.192595] PD TX complete, status: 0
[    3.196953] PD RX, header: 0x13af [1]
[    3.196959] Rx VDM cmd 0xff01a151 type 1 cmd 17 len 1
[    3.196966] AMS STRUCTURED_VDMS finished
[    6.562035] PD RX, header: 0x25af [1]
[    6.562044] Rx VDM cmd 0xff01a106 type 0 cmd 6 len 2
-- 
2.43.0


