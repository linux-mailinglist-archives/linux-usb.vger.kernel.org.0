Return-Path: <linux-usb+bounces-38181-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AhEKwUSG2qC+wgAu9opvQ
	(envelope-from <linux-usb+bounces-38181-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 18:36:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C760E4B7
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 18:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A3C83009B15
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 16:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5892DF134;
	Sat, 30 May 2026 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="h45gCPjY"
X-Original-To: linux-usb@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E932B11E
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158939; cv=none; b=MyAbHY7pWFm3a9NjkVO4IpT51H4EUgXxBJoJ/8cK7EhPczuLQCHQ6MXnBclW2NTeZvy50/DfAnlctjh5qlu0fYDgJAcaBkZDC36nydjPYqV/8oVKOtBVSJpQKA/ibCP1BqoPMqq3bSBErVz3YQnO72myneKeqk2lS9asF0aJMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158939; c=relaxed/simple;
	bh=2bML0ND1iT5IcuOt2BzKjOJwhnwnJx0dm8GY0Bm0tbQ=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=IjaYeIsopTuklciZVXSFuawU6InmSbSBBLBlNLhVTU6iuBER4ViMCb2fEF1h41TSNIbr0Yrqlek/uY99RTPG5CBHI1KFKD20H8CLOTfVAvpf8JIQcn6T2CuC5tWboBvXsyOqr8pX9dTS0YDqHBHLTwV4hZ+WirW6dSRq6FD9LSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=h45gCPjY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7BA642782C
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 18:35:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IEaQ1VS8ust for <linux-usb@vger.kernel.org>;
 Sat, 30 May 2026 18:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780158934; bh=2bML0ND1iT5IcuOt2BzKjOJwhnwnJx0dm8GY0Bm0tbQ=;
	h=Date:From:To:Subject;
	b=h45gCPjY1VxBX9D9NZGmZJ66oAGMQs4deaySWqXN4CThBhsWcLbq0bIMHw7XpCpWN
	 mqClkLSRqaD75Ipn4rtbwn0Qh8cX+ThF/SxbH45+c9e6X0a5eoWMeuUNna6mk28VDL
	 JSZk3LAcZ9BBCfQT/inyOLyUYFVBScWBIJX5Yk/3NyKQiwI/p/xA4arfTwEKR9fpfW
	 l5Mx57/tBeJ5eaJ/G1r/QJfd+G98XQJ+pmY8oXVCvOh+QTKDWMhFuW0Nlg3r+EifCG
	 fBotTu0EejYZUTjhhMGxPTAc0vk8aTDzwW0/suTS3MSxpHEY7UvxT8QHkelTQzJJNw
	 00F2vU4gJBRcA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 30 May 2026 18:35:33 +0200
From: anonreporting <anonreporting@disroot.org>
To: linux-usb@vger.kernel.org
Subject: cdc_ncm: short frames not padded to ETH_ZLEN, ARP broken with strict
 routers
Message-ID: <268e09ae8e9d02bf976f8cf0793fd0d8@disroot.org>
X-Sender: anonreporting@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38181-lists,linux-usb=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anonreporting@disroot.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:mid,disroot.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2A8C760E4B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I've been chasing a connectivity issue with a USB-C dock (DisplayLink, 
VID 17e9:6000,
driver cdc_ncm) and eventually tracked it down to the driver 
transmitting Ethernet frames
shorter than ETH_ZLEN without zero-padding them.

== Symptom ==

The interface gets a DHCP lease fine (BOOTP frames are large enough), 
but every attempt
to reach the default gateway fails with 100% packet loss. A Fritz!Box 
router is involved
on the other end.

tcpdump on the cdc_ncm interface shows outgoing ARP requests at 42 
bytes:

   14:03:07.112233 00:xx:xx:xx:xx:xx > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), \
     length 42: Request who-has 192.168.1.1 tell 192.168.1.x, length 28

Same ARP from an r8152 interface on the same machine (same cable, same 
switch port):

   14:03:07.112400 00:yy:yy:yy:yy:yy > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), \
     length 58: Request who-has 192.168.1.1 tell 192.168.1.x, length 44

So r8152 pads the 28-byte ARP payload to 44 bytes (16 bytes of zeros), 
giving a 58-byte
frame. cdc_ncm sends it raw at 42 bytes. IEEE 802.3 minimum is 60 bytes 
without FCS.
The Fritz!Box drops anything below ~50 bytes; 58-byte frames are 
accepted, 42-byte ones
are not.

== Root cause ==

The cdc_ncm TX path in cdc_ncm_fill_tx_frame() packs SKBs into NCM 
Transfer Blocks
(NTBs) without ensuring each frame meets ETH_ZLEN. An ARP request 
arrives as a
42-byte SKB and is placed into the NTB verbatim:

     skb_put_data(skb_out, skb->data, skb->len);
     ctx->tx_curr_frame_payload += skb->len;
     dev_kfree_skb_any(skb);

Neither eth_skb_pad() nor ETH_ZLEN appears anywhere in the cdc_ncm TX 
path
(verified against current tree). Other USB Ethernet drivers — r8152 
being the
working reference here — call eth_skb_pad() before the frame reaches 
hardware.

== Suggested fix (untested, no patch built) ==

The padding needs to happen before skb->len is first used for NDP space 
reservation
(the cdc_ncm_ndp16/ndp32 call), not just before skb_put_data(). The 
following is an
untested sketch:

--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ cdc_ncm_fill_tx_frame(), before the NDP allocation block:
+		/* ensure frame meets IEEE 802.3 minimum; eth_skb_pad() frees skb on 
failure */
+		if (skb->len < ETH_ZLEN && eth_skb_pad(skb)) {
+			skb = NULL;
+			dev->net->stats.tx_dropped++;
+			break;
+		}
+
  		/* get the appropriate NDP for this skb */
  		if (ctx->is_ndp16)
  			ndp.ndp16 = cdc_ncm_ndp16(ctx, skb_out, sign,
  					skb->len + ctx->tx_modulus + ctx->tx_remainder);
  		else
  			ndp.ndp32 = cdc_ncm_ndp32(ctx, skb_out, sign,
  					skb->len + ctx->tx_modulus + ctx->tx_remainder);

This placement ensures skb->len already reflects the padded length when 
NDP space
is reserved, when the fit check runs, and when wDatagramLength is 
written into the
NDP entry. The break is conservative on alloc failure — it sends the 
current NTB
without the dropped frame rather than risking use-after-free.

I have not compiled or tested this — leaving it to someone who knows the 
error
paths in cdc_ncm_fill_tx_frame() better than I do.

== Notes ==

- DHCP frames are unaffected (large enough), so the issue only shows up 
after the
   interface is up and the kernel starts sending ARP — which can make it 
look like a
   routing or ARP cache problem rather than a driver issue.

- The exact same hardware works correctly when the Fritz!Box is replaced 
with a switch
   that is more lenient about frame size, which was another red herring 
during diagnosis.

- Kernel: 6.12.74+deb13+1-amd64 (Debian 13)
- Affected: DisplayLink USB-C Triple-4K Dock, 17e9:6000, cdc_ncm
- Working reference: Realtek RTL8153, 0bda:8153, r8152

I'm happy to test patches.

Regards,
anonreporting <anonreporting@disroot.org>

