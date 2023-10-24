Return-Path: <linux-usb+bounces-2115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBF7D4942
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 10:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88105280E5E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 08:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943AD15E92;
	Tue, 24 Oct 2023 08:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E581FB9
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 08:06:12 +0000 (UTC)
X-Greylist: delayed 399 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 Oct 2023 01:06:09 PDT
Received: from outgoing.selfhost.de (mordac.selfhost.de [82.98.82.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8359099
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 01:06:09 -0700 (PDT)
Received: (qmail 10812 invoked from network); 24 Oct 2023 07:59:27 -0000
Received: from unknown (HELO mailhost.afaics.de) (postmaster@xqrsonfo.mail.selfhost.de@87.160.240.201)
  by mailout.selfhost.de with ESMTPA; 24 Oct 2023 07:59:27 -0000
Received: from [IPV6:2003:e3:1f04:d903:68fd:ffff:fe6f:e76] (p200300e31f04d90368fdfffffe6f0e76.dip0.t-ipconnect.de [2003:e3:1f04:d903:68fd:ffff:fe6f:e76])
	by marvin.afaics.de (OpenSMTPD) with ESMTP id ba787281;
	Tue, 24 Oct 2023 09:59:27 +0200 (CEST)
Message-ID: <cf258eb0-58c5-4661-bf2a-7366fb0aa3b9@afaics.de>
Date: Tue, 24 Oct 2023 09:59:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Content-Language: en-US
From: Harald Dunkel <harri@afaics.de>
Subject: JMS583Gen2 USB PCIe adapter with trim support?
Autocrypt: addr=harri@afaics.de; keydata=
 xsBNBFIHbdABCACYHRLHGdFRk7bWkgdPhDLin6jLIS0ppegsx0Vc9STFyiHFUW+6HU9ZYTpO
 f2qbcWlE3YJYacy6zOiiTjYX31quhvGrP3UJXKjXsAp7CFsMxRJUhm20Ph0nCl/Oed9SDNXN
 HQJwHoOVWrsu/sGxNTfjCWRJleBE11P+TuuLOAP9dbqFbWhmkTsE9Lp9d16Ak77MWmWWxBvD
 cBsUuC2GOYDfFOPM3j16w7aw4Y9GI2B5QzFiHvOR/hCazfDEMQAlaHMm6sH8uzrjNEtB5dvm
 vxF8j/IpvsuvWGhZ68rej2gPwoVrRTEBaYslW8/5dm8o1HuTkuLqxhNTcvYWyV8uKRtTABEB
 AAHNH0hhcmFsZCBEdW5rZWwgPGhhcnJpQGFmYWljcy5kZT7CwHoEEwEIACQCGwMCHgECF4AC
 GQEFAlQYLhUFCwkIBwMFFQoJCAsFFgIDAQAACgkQCp4qnmbTgcu7Fwf/RoWwNDxJPD96vBFb
 Jzfta9qVA0JpbKoMAnNY0tDWiF5Ur8UY/tv/RDVV44Vx3Ef0fzQZN0CtHsNfAKO+KXBMUiuT
 AP4AadpaIwYMo8v+SmPzJSUxWgBm6IsHwn1udXRdEgdR9guWkLPRGCK3x84sorAOUnUHJHkq
 UrDFQUNfNA9lqM7ttunfVtG4SaqcLEOpJ1s/aMUsEODlP/lws42VjubIVg403cMIgvqs5cT8
 EjLDNqCwEoWZRhfpg5x3D5uNDNWSW70Z+6Knicbi129QIu4HtSnfrxiuvHz2LLPFOVQuj8h4
 TPT6tkfIURKipFXoIC3YiK8f94rFO3q86oNJUs7ATQRSB23QAQgA27gQiXZ96pbJkGoz1RWX
 T8WSQJ5TWVJyf4eswoVI8Ffk5vLE+xPpAYEDkL7JYGCvBN1BKrcaZzDy8Irfys6bHI3JmVVi
 ZloSkVS8QL7pQGfp74VT3NvDjK6LDe9QMv8Rb45laSRD5XCGRMTxz9pwu3vNcOPCfV5nmbyB
 /6h4/bguFH1+6aGz6HyC8v/tjhL6+cY329inJ+vWVJYssweMIIYpssUtDaPKZO0080toLLrt
 KuVgiUb9llbmZgKGElRjwgGT8AUXDRFCzn0ws/nuGNw0L+EdCI3VdZSK5KMEO34vZq7iNeM1
 ZVnPVZAbHheR30NFKTgrwvlt8G7blHJPWwARAQABwsBfBBgBCAAJBQJSB23QAhsMAAoJEAqe
 Kp5m04HLiiEH/jlKumVyQrOxH58iQFzVDthDfJdBLmnDlfVx2Dzn60vc5To6yJ3fwO21s3xC
 /LW9aZSfDueV0nWU4/Wow/X5GEH90Vc1sFoeSZb/GW03vsO1n/OFIVlv9GQv+RviWMDEwKKx
 CMvdqUlVblWf1iT/ngPN0YawKGF0Dgn8TRzfL/Tq9muwNUaONzz8PWBUIm1+8JDZszYLzLoz
 YiY0usL4GH9BCeW6XG2Q6j4cpyOQZ0VKiBs1Rh+dmswn+iXLfi08Q0IxYAD6wjHdJTBD9pE9
 5Uj8/1spt51FBAAIP+7sd2mpAvsNnojatuOgjBmBxFwiOKeyDNe1wvKr4dsRheOLV8M=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

according to https://www.jmicron.com/file/download/1002/JMS583_Product+Brief.pdf
my USB-C M.2 adapter "JMicron USA Technology Corp. JMS583Gen 2 to PCIe Gen3x2 Bridge"
is supposed to support trim, but sg_vpd reports

{root@cecil:data10 () 506} sg_vpd -p bl /dev/sdd
Block limits VPD page (SBC):
   Write same non-zero (WSNZ): 0
   Maximum compare and write length: 0 blocks [Command not implemented]
   Optimal transfer length granularity: 8 blocks
   Maximum transfer length: 65535 blocks
   Optimal transfer length: 65535 blocks
   Maximum prefetch transfer length: 65535 blocks
   Maximum unmap LBA count: -1 [unbounded]
   Maximum unmap block descriptor count: 63
   Optimal unmap granularity: 0 blocks [not reported]
   Unmap granularity alignment valid: false
   Unmap granularity alignment: 0 [invalid]
   Maximum write same length: 0 blocks [not reported]
   Maximum atomic transfer length: 0 blocks [not reported]
   Atomic alignment: 0 [unaligned atomic writes permitted]
   Atomic transfer length granularity: 0 [no granularity requirement
   Maximum atomic transfer length with atomic boundary: 0 blocks [not reported]
   Maximum atomic boundary size: 0 blocks [can only write atomic 1 block]

{root@cecil:data10 () 507} sg_vpd -p lbpv /dev/sdd
Logical block provisioning VPD page (SBC):
   Unmap command supported (LBPU): 1
   Write same (16) with unmap bit supported (LBPWS): 0
   Write same (10) with unmap bit supported (LBPWS10): 0
   Logical block provisioning read zeros (LBPRZ): 0
   Anchored LBAs supported (ANC_SUP): 0
   Threshold exponent: 0 [threshold sets not supported]
   Descriptor present (DP): 0
   Minimum percentage: 0 [not reported]
   Provisioning type: 0 (not known or fully provisioned)
   Threshold percentage: 0 [percentages not supported]

{root@cecil:data10 () 508} lsusb
Bus 002 Device 004: ID 152d:0583 JMicron Technology Corp. / JMicron USA Technology Corp. JMS583Gen 2 to PCIe Gen3x2 Bridge
:


You can surely better estimate than me whether these values sound
reasonable. Do they? I hesitate to set provisioning_mode to unmap.

Device is an ICY BOX M.2 SSD/NVMe adaptor IB-1807MT-C31.


Regards

Harri

