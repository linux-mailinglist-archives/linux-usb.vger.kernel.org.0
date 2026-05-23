Return-Path: <linux-usb+bounces-37976-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNW9KmnbEWq0rQYAu9opvQ
	(envelope-from <linux-usb+bounces-37976-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 18:52:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 212275BFE55
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 18:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08B0A3014505
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 16:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFFA31E839;
	Sat, 23 May 2026 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=krang.de header.i=@krang.de header.b="GBUyq7/H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.segnitz.net (mail.segnitz.net [116.203.138.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D20221FB6
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.138.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779555172; cv=none; b=mppcXOO0KeW/9lnbBQUF11X834vUzuLO4l5eUdOFksPZ20QrX+XGcyjadaDvS1CQynKkX1M6aT4GyXOVh2xWiNxcxsTHF/zpUdpHVnsJ08Ua8zWRWiA1DE+TED0Q/7yxmexvOkPx0Fz/8OtJ6hd4j6aEpRJhhbjzv3+mvHl78Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779555172; c=relaxed/simple;
	bh=cVygA3ywUVoIfQYUwmmZ+VAF+lKtZmTpSfptLj00JcM=;
	h=From:Content-Type:Date:Cc:To:MIME-Version:Message-ID:Subject; b=m6fT/hJYIQTYfhJ5AUEqrTFdzTIRwkV34SOllMBxmOEiDPi6urtxbR51dkNPfgYf7M/1mFQDgaK2v1vqd4ectvQhrSOu5iUuUXF580JV1VEIVv1uhkW9WnsAS/dOYvgNpEC+vegTm4MhFAErhLeKFts3LOBbPwK7jllxHJZKJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=krang.de; spf=pass smtp.mailfrom=krang.de; dkim=fail (0-bit key) header.d=krang.de header.i=@krang.de header.b=GBUyq7/H reason="key not found in DNS"; arc=none smtp.client-ip=116.203.138.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=krang.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krang.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 12BB05D6BA4;
	Sat, 23 May 2026 18:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krang.de; s=dkim;
	t=1779554589; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=h9bf+8G//ncFR5sRc6gL5nQf1LFh8+mtvoeimpvHPFU=;
	b=GBUyq7/HJOTinhhl+SdYJrAgMwGd2MQ+qYs/DbGfO+MF7julPAIoZBMxMnfpGfd/GQ7MfX
	k7CrbECyAf3EuMyJpvDtfY18l/MTy2WkF0Yh+U7pC8vJRJWXJuDt/ShUtD5sWJqIRqQqWF
	1Z847BiPXP//DM8fuWPjbrgoRPr4j0I=
From: "Sebastian Loscher" <krang@krang.de>
Content-Type: multipart/mixed; boundary="----=_=-_OpenGroupware_org_NGMime-77-1779554586.686912-85------"
Date: Sat, 23 May 2026 18:43:06 +0200
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, michael.jamet@intel.com
To: mika.westerberg@linux.intel.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
Subject: [BUG] =?utf-8?q?thunderbolt=3A?= USB4 v2 TBGAA tunnel creation crash in TMU 
 enhanced uni-directional mode
User-Agent: SOGoMail 5.12.3
X-Last-TLS-Session-Version: None
X-Spamd-Result: default: False [1.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37976-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com];
	R_DKIM_PERMFAIL(0.00)[krang.de:s=dkim];
	DMARC_NA(0.00)[krang.de];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_SPAM(0.00)[0.169];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krang@krang.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[krang.de:~];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 212275BFE55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

------=_=-_OpenGroupware_org_NGMime-77-1779554586.686912-85------
Content-Type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-77-1779554586.686168-84------"

------=_=-_OpenGroupware_org_NGMime-77-1779554586.686168-84------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1607


Hi Mika and the Linux USB team,
I hope you are well. I am testing a new Thunderbolt 5 setup on a brand-=
new AMD Strix Halo system, and I have run into a reproducible hardware =
panic during the initial connection handshake.
I have gathered full dynamic debug traces and would appreciate your ins=
ight on whether this requires a specific hardware quirk.

This is my first report in such format ever, maybe big for me but pleas=
e bare with me.

Hardware:
Host: Minisforum MS-S1 Max (AMD Strix Halo USB4 v2 controller)
Dock: Minisforum eGPU dock (Vendor 0x41f, Device 0xd002, TBGAA controll=
er)
Kernel: CachyOS (state your exact kernel version, e.g., 6.12-rcX)
The Issue:
When plugging in the Thunderbolt 5 dock, the connection fails during US=
B3 tunnel creation and drops entirely.
Using dyndbg=3D"file drivers/thunderbolt/* +p", the trace shows the AMD=
 host successfully shifting the dock into TB5 asymmetric routing (TMU: =
mode set to: enhanced uni-directional, MedRes). However, immediately af=
ter querying the NVM authentication status of the retimers (reading NVM=
 authentication status of retimers), the dock suffers a hardware panic =
and physically drops the link (acking hot unplug event on 0:1).
The subsequent -107 and -71 PCIe/USB errors appear to be the Linux driv=
er attempting to route through a connection the dock has already severe=
d.
Attached:
Full dynamic debug dmesg trace of the hotplug event.

I deeply hope this contribution can help the community. Let me know if =
there is anything else I can help with. And keep up the great work.

Kind regards

Sebastian

------=_=-_OpenGroupware_org_NGMime-77-1779554586.686168-84------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1824

<html><p data-path-to-node=3D"4,0">Hi Mika and the Linux USB team,</p><=
p data-path-to-node=3D"4,1">I hope you are well. I am testing a new Thu=
nderbolt 5 setup on a brand-new AMD Strix Halo system, and I have run i=
nto a reproducible hardware panic during the initial connection handsha=
ke.</p><p data-path-to-node=3D"4,2">I have gathered full dynamic debug =
traces and would appreciate your insight on whether this requires a spe=
cific hardware quirk.<br><br>This is my first report in such format eve=
r, maybe big for me but please bare with me.<br><br>Hardware:</p><p>Hos=
t: Minisforum MS-S1 Max (AMD Strix Halo USB4 v2 controller)</p><p>Dock:=
 Minisforum eGPU dock (Vendor 0x41f, Device 0xd002, TBGAA controller)</=
p><p>Kernel: CachyOS (state your exact kernel version, e.g., 6.12-rcX)<=
/p><p>The Issue:<br>When plugging in the Thunderbolt 5 dock, the connec=
tion fails during USB3 tunnel creation and drops entirely.</p><p>Using =
dyndbg=3D"file drivers/thunderbolt/* +p", the trace shows the AMD host =
successfully shifting the dock into TB5 asymmetric routing (TMU: mode s=
et to: enhanced uni-directional, MedRes). However, immediately after qu=
erying the NVM authentication status of the retimers (reading NVM authe=
ntication status of retimers), the dock suffers a hardware panic and ph=
ysically drops the link (acking hot unplug event on 0:1).</p><p>The sub=
sequent -107 and -71 PCIe/USB errors appear to be the Linux driver atte=
mpting to route through a connection the dock has already severed.</p><=
p>Attached:<br>Full dynamic debug dmesg trace of the hotplug event.<br>=
<br>I deeply hope this contribution can help the community. Let me know=
 if there is anything else I can help with. And keep up the great work.=
<br><br>Kind regards<br><br>Sebastian</p></html>

------=_=-_OpenGroupware_org_NGMime-77-1779554586.686168-84--------

------=_=-_OpenGroupware_org_NGMime-77-1779554586.686912-85------
Content-Type: text/plain
Content-Disposition: attachment; filename="egpu_crash_log.txt"
Content-Transfer-Encoding: quoted-printable
Content-Length: 17335

[  332.894110] [UFW BLOCK] IN=3Denp98s0 OUT=3D MAC=3D SRC=3Dfe80:0000:0=
000:0000:ee0c:b911:402c:55a2 DST=3Dff02:0000:0000:0000:0000:0000:0001:0=
003 LEN=3D76 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D319052 PROTO=3DUDP SPT=3D5=
355 DPT=3D5355 LEN=3D36=20
[  335.894390] [UFW BLOCK] IN=3Denp97s0 OUT=3D MAC=3D SRC=3D10.23.1.207=
 DST=3D224.0.0.252 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D255 ID=3D13896=
 PROTO=3DUDP SPT=3D5355 DPT=3D5355 LEN=3D36=20
[  352.890811] [UFW BLOCK] IN=3Denp98s0 OUT=3D MAC=3D SRC=3Dfe80:0000:0=
000:0000:ee0c:b911:402c:55a2 DST=3Dff02:0000:0000:0000:0000:0000:0001:0=
003 LEN=3D76 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D319052 PROTO=3DUDP SPT=3D5=
355 DPT=3D5355 LEN=3D36=20
[  355.893947] [UFW BLOCK] IN=3Denp98s0 OUT=3D MAC=3D SRC=3D10.23.107.2=
08 DST=3D224.0.0.252 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D255 ID=3D805=
6 PROTO=3DUDP SPT=3D5355 DPT=3D5355 LEN=3D36=20
[  370.697051] thunderbolt 0000:67:00.0: acking hot plug event on 0:1
[  370.697152] thunderbolt 0000:67:00.0: 0:1: hotplug: scanning
[  370.697256] thunderbolt 0000:67:00.0: 0:1: is connected, link is up =
(state: 2)
[  370.697795] thunderbolt 0000:67:00.0: current switch config:
[  370.697803] thunderbolt 0000:67:00.0:  USB4 Switch: 8087:5786 (Revis=
ion: 133, TB Version: 64)
[  370.697807] thunderbolt 0000:67:00.0:   Max Port Number: 23
[  370.697810] thunderbolt 0000:67:00.0:   Config:
[  370.697812] thunderbolt 0000:67:00.0:    Upstream Port Number: 1 Dep=
th: 0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
[  370.697815] thunderbolt 0000:67:00.0:    unknown1: 0x0 unknown4: 0x0
[  370.700819] thunderbolt 0000:67:00.0: initializing Switch at 0x1 (de=
pth: 1, up port: 1)
[  370.701184] thunderbolt 0000:67:00.0: 1: link: USB4
[  370.701185] thunderbolt 0000:67:00.0: 1: TBT3 support: yes, xHCI: ye=
s
[  370.702464] thunderbolt 0000:67:00.0: 1: credit allocation parameter=
s:
[  370.702465] thunderbolt 0000:67:00.0: 1:  USB3: 20
[  370.702466] thunderbolt 0000:67:00.0: 1:  DP AUX: 1
[  370.702466] thunderbolt 0000:67:00.0: 1:  DP main: 6
[  370.702467] thunderbolt 0000:67:00.0: 1:  PCIe: 76
[  370.702468] thunderbolt 0000:67:00.0: 1:  unknown credit allocation =
index 0x0, skipping
[  370.706433] thunderbolt 0000:67:00.0: 1: DROM version: 1
[  370.708353] thunderbolt 0000:67:00.0: 1: uid: 0x1bce40080871534
[  370.709632] thunderbolt 0000:67:00.0:  Port 1: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.709634] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.709635] thunderbolt 0000:67:00.0:   Max counters: 4
[  370.709635] thunderbolt 0000:67:00.0:   NFC Credits: 0x4a000000
[  370.709636] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.710784] thunderbolt 0000:67:00.0:  Port 2: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.710785] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.710785] thunderbolt 0000:67:00.0:   Max counters: 0
[  370.710786] thunderbolt 0000:67:00.0:   NFC Credits: 0xca000000
[  370.710786] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.711929] thunderbolt 0000:67:00.0: acking hot plug event on 1:13
[  370.712061] thunderbolt 0000:67:00.0: acking hot plug event on 1:14
[  370.712066] thunderbolt 0000:67:00.0:  Port 3: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.712067] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.712068] thunderbolt 0000:67:00.0:   Max counters: 4
[  370.712068] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
[  370.712069] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.712189] thunderbolt 0000:67:00.0: acking hot plug event on 1:16
[  370.713215] thunderbolt 0000:67:00.0:  Port 4: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.713216] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.713217] thunderbolt 0000:67:00.0:   Max counters: 0
[  370.713217] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
[  370.713217] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.714495] thunderbolt 0000:67:00.0:  Port 5: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.714496] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.714497] thunderbolt 0000:67:00.0:   Max counters: 4
[  370.714497] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
[  370.714497] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.715647] thunderbolt 0000:67:00.0:  Port 6: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.715648] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.715649] thunderbolt 0000:67:00.0:   Max counters: 0
[  370.715649] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
[  370.715649] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.716928] thunderbolt 0000:67:00.0:  Port 7: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.716929] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.716929] thunderbolt 0000:67:00.0:   Max counters: 4
[  370.716930] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
[  370.716930] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.718079] thunderbolt 0000:67:00.0:  Port 8: 0:5780 (Revision: 0, =
TB Version: 1, Type: Port (0x1))
[  370.718080] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
[  370.718081] thunderbolt 0000:67:00.0:   Max counters: 0
[  370.718081] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
[  370.718082] thunderbolt 0000:67:00.0:   Credits (total/control): 160=
/2
[  370.718336] thunderbolt 0000:67:00.0:  Port 9: 0:5780 (Revision: 0, =
TB Version: 1, Type: PCIe (0x100102))
[  370.718337] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.718337] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.718338] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
[  370.718338] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.718591] thunderbolt 0000:67:00.0:  Port 10: 0:5780 (Revision: 0,=
 TB Version: 1, Type: PCIe (0x100101))
[  370.718592] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.718593] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.718593] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
[  370.718593] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.719103] thunderbolt 0000:67:00.0:  Port 11: 0:5780 (Revision: 0,=
 TB Version: 1, Type: DP/HDMI (0xe0102))
[  370.719105] thunderbolt 0000:67:00.0:   Max hop id (in/out): 9/9
[  370.719105] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.719105] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.719106] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.719615] thunderbolt 0000:67:00.0:  Port 12: 0:5780 (Revision: 0,=
 TB Version: 1, Type: DP/HDMI (0xe0102))
[  370.719616] thunderbolt 0000:67:00.0:   Max hop id (in/out): 9/9
[  370.719617] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.719617] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.719618] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.719618] thunderbolt 0000:67:00.0: 1:13: disabled by eeprom
[  370.719619] thunderbolt 0000:67:00.0: 1:14: disabled by eeprom
[  370.719746] thunderbolt 0000:67:00.0:  Port 15: not implemented
[  370.719746] thunderbolt 0000:67:00.0: 1:16: disabled by eeprom
[  370.719999] thunderbolt 0000:67:00.0:  Port 17: 0:5780 (Revision: 0,=
 TB Version: 1, Type: PCIe (0x100101))
[  370.720000] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.720001] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.720001] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
[  370.720002] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.720255] thunderbolt 0000:67:00.0:  Port 18: 0:5780 (Revision: 0,=
 TB Version: 1, Type: PCIe (0x100101))
[  370.720256] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.720257] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.720257] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
[  370.720258] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.720768] thunderbolt 0000:67:00.0:  Port 19: 0:5780 (Revision: 0,=
 TB Version: 1, Type: DP/HDMI (0xe0102))
[  370.720769] thunderbolt 0000:67:00.0:   Max hop id (in/out): 9/9
[  370.720769] thunderbolt 0000:67:00.0:   Max counters: 2
[  370.720770] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.720770] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.721023] thunderbolt 0000:67:00.0:  Port 20: 0:5780 (Revision: 0,=
 TB Version: 1, Type: USB (0x200102))
[  370.721024] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.721025] thunderbolt 0000:67:00.0:   Max counters: 1
[  370.721025] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.721026] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.721279] thunderbolt 0000:67:00.0:  Port 21: 0:5780 (Revision: 0,=
 TB Version: 1, Type: USB (0x200101))
[  370.721280] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.721281] thunderbolt 0000:67:00.0:   Max counters: 1
[  370.721281] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.721282] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.721535] thunderbolt 0000:67:00.0:  Port 22: 0:5780 (Revision: 0,=
 TB Version: 1, Type: USB (0x200101))
[  370.721536] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.721537] thunderbolt 0000:67:00.0:   Max counters: 1
[  370.721537] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.721537] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.721791] thunderbolt 0000:67:00.0:  Port 23: 0:5780 (Revision: 0,=
 TB Version: 1, Type: USB (0x200101))
[  370.721792] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
[  370.721793] thunderbolt 0000:67:00.0:   Max counters: 1
[  370.721793] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
[  370.721793] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
[  370.721794] thunderbolt 0000:67:00.0: 1: running quirk=5Fusb3=5Fmaxi=
mum=5Fbandwidth [thunderbolt]
[  370.721818] thunderbolt 0000:67:00.0: 1:21: USB3 maximum bandwidth l=
imited to 16376 Mb/s
[  370.721819] thunderbolt 0000:67:00.0: 1:22: USB3 maximum bandwidth l=
imited to 16376 Mb/s
[  370.721820] thunderbolt 0000:67:00.0: 1:23: USB3 maximum bandwidth l=
imited to 16376 Mb/s
[  370.722047] thunderbolt 0000:67:00.0: 1: current link speed 40.0 Gb/=
s
[  370.722048] thunderbolt 0000:67:00.0: 1: current link width symmetri=
c, dual lanes
[  370.722687] thunderbolt 0000:67:00.0: 1: preferred link width symmet=
ric, dual lanes
[  370.723455] thunderbolt 0000:67:00.0: 1: CLx: current mode: disabled
[  370.730752] thunderbolt 0000:67:00.0: 1: TMU: supports uni-direction=
al mode
[  370.730753] thunderbolt 0000:67:00.0: 1: TMU: supports enhanced uni-=
directional mode
[  370.731136] thunderbolt 0000:67:00.0: 1: TMU: current mode: off
[  370.733484] thunderbolt 0-1: new device found, vendor=3D0x41f device=
=3D0xd002
[  370.733486] thunderbolt 0-1: Micro Computer (HK) Tech. Ltd. TBGAA
[  370.735631] thunderbolt 0000:67:00.0: 1: NVM version 62.42
[  370.737726] thunderbolt 0000:67:00.0: 0:1: reading NVM authenticatio=
n status of retimers
[  370.940313] thunderbolt 0000:67:00.0: 0:1: disabling sideband transa=
ctions
[  371.042092] thunderbolt 0000:67:00.0: 1:1: CLx: CL0s/CL1/CL2 support=
ed
[  371.042099] thunderbolt 0000:67:00.0: 0:1: CLx: CL0s/CL1/CL2 support=
ed
[  371.042594] thunderbolt 0000:67:00.0: 1: CLx: CL0s/CL1/CL2 enabled
[  371.042598] thunderbolt 0000:67:00.0: 1: TMU: mode change off -> enh=
anced uni-directional, MedRes requested
[  371.042718] thunderbolt 0000:67:00.0: 0: TMU: local=5Ftime[0]=3D0x5a=
400000
[  371.042721] thunderbolt 0000:67:00.0: 0: TMU: local=5Ftime[1]=3D0x00=
5523e1
[  371.042723] thunderbolt 0000:67:00.0: 0: TMU: local=5Ftime[2]=3D0x03=
e80000
[  371.043821] thunderbolt 0000:67:00.0: 1: TMU: updated local time to =
0x5523e15a40
[  371.048099] thunderbolt 0000:67:00.0: 1: TMU: mode set to: enhanced =
uni-directional, MedRes
[  371.050527] thunderbolt 0000:67:00.0: 1:1: reading NVM authenticatio=
n status of retimers
[  371.201482] thunderbolt 0000:67:00.0: acking hot unplug event on 0:1
[  371.301780] thunderbolt 0000:67:00.0: 1:1: disabling sideband transa=
ctions
[  371.302412] thunderbolt 0000:67:00.0: 0:1: link maximum bandwidth 90=
00/9000 Mb/s
[  371.302655] thunderbolt 0000:67:00.0: 1:1: link maximum bandwidth 72=
000/72000 Mb/s
[  371.302782] thunderbolt 0000:67:00.0: 1:20: available bandwidth for =
new USB3 tunnel 9000/9000 Mb/s
[  371.303024] thunderbolt 0000:67:00.0: 1: USB3 tunnel creation failed
[  371.303922] thunderbolt 0000:67:00.0: 0:9 <-> 1:9 (PCI): activating
[  371.303925] thunderbolt 0000:67:00.0: activating PCIe Down path from=
 0:9 to 1:9
[  371.304046] thunderbolt 0000:67:00.0: 1:1: Writing hop 1
[  371.304047] thunderbolt 0000:67:00.0: 1:1:  In HopID: 8 =3D> Out por=
t: 9 Out HopID: 8
[  371.304048] thunderbolt 0000:67:00.0: 1:1:   Weight: 1 Priority: 3 C=
redits: 76 Drop: 0 PM: 0
[  371.304049] thunderbolt 0000:67:00.0: 1:1:    Counter enabled: 0 Cou=
nter index: 2047
[  371.304050] thunderbolt 0000:67:00.0: 1:1:   Flow Control (In/Eg): 1=
/0 Shared Buffer (In/Eg): 0/0
[  371.304051] thunderbolt 0000:67:00.0: 1:1:   Unknown1: 0x0 Unknown2:=
 0x0 Unknown3: 0x0
[  371.304302] thunderbolt 0000:67:00.0: 1:1: hop deactivation failed f=
or hop 1, index 8
[  371.304303] thunderbolt 0000:67:00.0: PCIe Down path activation fail=
ed: -107
[  371.304304] thunderbolt 0000:67:00.0: 0:9 <-> 1:9 (PCI): activation =
failed
[  371.304305] thunderbolt 0000:67:00.0: 0:9 <-> 1:9 (PCI): deactivatin=
g
[  371.304948] thunderbolt 0000:67:00.0: 1:9: PCIe tunnel activation fa=
iled, aborting
[  371.304981] thunderbolt 0000:67:00.0: 0:1: switch unplugged
[  371.305759] thunderbolt 0-1: device disconnected
[  371.306674] thunderbolt 0000:67:00.0: bandwidth consumption changed,=
 re-calculating estimated bandwidth
[  371.306677] thunderbolt 0000:67:00.0: bandwidth re-calculation done
[  371.306678] thunderbolt 0000:67:00.0: looking for DP IN <-> DP OUT p=
airs:
[  371.306705] thunderbolt 0000:67:00.0: 0:13: DP IN available
[  371.306706] thunderbolt 0000:67:00.0: 0:13: no suitable DP OUT adapt=
er available, not tunneling
[  371.306833] thunderbolt 0000:67:00.0: 0:14: DP IN available
[  371.306834] thunderbolt 0000:67:00.0: 0:14: no suitable DP OUT adapt=
er available, not tunneling
[  371.421827] usb 5-1: new high-speed USB device number 8 using xhci=5F=
hcd
[  371.549027] usb 5-1: New USB device found, idVendor=3D1d5c, idProduc=
t=3D5801, bcdDevice=3D 1.01
[  371.549043] usb 5-1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[  371.549044] usb 5-1: Product: USB2.0 Hub
[  371.549047] usb 5-1: Manufacturer: Fresco Logic, Inc.
[  371.588232] hub 5-1:1.0: USB hub found
[  371.588621] hub 5-1:1.0: 6 ports detected
[  372.195131] usb 5-1.2: new high-speed USB device number 9 using xhci=
=5Fhcd
[  372.292245] usb 5-1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5420, bcdDevice=3D 1.80
[  372.292256] usb 5-1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
[  372.292259] usb 5-1.2: Product: 4-Port USB 2.0 Hub
[  372.292260] usb 5-1.2: Manufacturer: Generic
[  372.356618] hub 5-1.2:1.0: USB hub found
[  372.357272] hub 5-1.2:1.0: 4 ports detected
[  372.894153] [UFW BLOCK] IN=3Denp98s0 OUT=3D MAC=3D SRC=3Dfe80:0000:0=
000:0000:ee0c:b911:402c:55a2 DST=3Dff02:0000:0000:0000:0000:0000:0001:0=
003 LEN=3D76 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D319052 PROTO=3DUDP SPT=3D5=
355 DPT=3D5355 LEN=3D36=20
[  373.106976] usb 5-1.2.3: new high-speed USB device number 10 using x=
hci=5Fhcd
[  373.206451] usb 5-1.2.3: New USB device found, idVendor=3D0bda, idPr=
oduct=3D8156, bcdDevice=3D31.04
[  373.206463] usb 5-1.2.3: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D6
[  373.206465] usb 5-1.2.3: Product: USB 10/100/1G/2.5G LAN
[  373.206467] usb 5-1.2.3: Manufacturer: Realtek
[  373.206469] usb 5-1.2.3: SerialNumber: 4013000001
[  373.347588] r8152-cfgselector 5-1.2.3: reset high-speed USB device n=
umber 10 using xhci=5Fhcd
[  373.728871] usb 5-1.2.4: new high-speed USB device number 11 using x=
hci=5Fhcd
[  373.852519] usb 5-1.2.4: New USB device found, idVendor=3D152d, idPr=
oduct=3D0583, bcdDevice=3D 2.14
[  373.852545] usb 5-1.2.4: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D3
[  373.852548] usb 5-1.2.4: Product: USB to PCIE Bridge
[  373.852550] usb 5-1.2.4: Manufacturer: JMicron
[  373.852552] usb 5-1.2.4: SerialNumber: 0123456789ABCDEF
[  373.854075] scsi host0: uas
[  373.854542] scsi 0:0:0:0: Direct-Access     JMicron  Generic        =
  0214 PQ: 0 ANSI: 6
[  373.898145] usb 5-1.2.4: stat urb: status -71
[  375.893793] [UFW BLOCK] IN=3Denp97s0 OUT=3D MAC=3D SRC=3D10.23.1.207=
 DST=3D224.0.0.252 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D255 ID=3D34161=
 PROTO=3DUDP SPT=3D5355 DPT=3D5355 LEN=3D36=20
[  392.894057] [UFW BLOCK] IN=3Denp98s0 OUT=3D MAC=3D SRC=3Dfe80:0000:0=
000:0000:ee0c:b911:402c:55a2 DST=3Dff02:0000:0000:0000:0000:0000:0001:0=
003 LEN=3D76 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D319052 PROTO=3DUDP SPT=3D5=
355 DPT=3D5355 LEN=3D36=20


------=_=-_OpenGroupware_org_NGMime-77-1779554586.686912-85--------


