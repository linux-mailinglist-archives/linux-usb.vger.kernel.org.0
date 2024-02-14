Return-Path: <linux-usb+bounces-6389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34996854552
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 10:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFE97291BF9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12619171A2;
	Wed, 14 Feb 2024 09:31:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570DB17580
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707903098; cv=none; b=DQCY1hCsvdHmIEMDn3yl/LGodqZNYpRG34Rd70+c1uLq0GXbXIV92n6EZ6DI3Dql9HeK/UTcarMvOYDJaDnm0xVuGdA3BD84AdapZpCOqMsFUQN/5siFMORs8B3E73f+yuBUWXdJEffU1kn+8iw7/ePRcDMrZjLNpGup7RKMCHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707903098; c=relaxed/simple;
	bh=1fIeqj6mx/dVIW/xV/Md4uMgkuLxMfZdZ8gac2RgnU8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=GBxynufaYCuno4axvFkC/GooLaC1LUYeXGJHpCCPHGz3RCmQ2SRNRQmmp7VpZZ6NYCPLynJeTYUtDPp4tDy48+Hyx8O+igx+SzGUx0dVwpYZl9DbyVZq9otZm/AOW1fTrUNkf8OtQuHLykouVplGNkrZ0btlioDb2C9AzKm/id8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aea4b.dynamic.kabel-deutschland.de [95.90.234.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 40B5D61E5FE01;
	Wed, 14 Feb 2024 10:31:08 +0100 (CET)
Message-ID: <5406d361-f5b7-4309-b0e6-8c94408f7d75@molgen.mpg.de>
Date: Wed, 14 Feb 2024 10:31:04 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Linux warns `usb: port power management may be unreliable` on several
 systems
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 "Artem S. Tashkinov" <aros@gmx.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Linux folks,


As a follow-up to *Linux warning `usb: port power management may be 
unreliable` on Dell XPS 13 9360* [1][2], Linux warns about this on Dell 
laptops, desktops, and servers, and also on devices from other 
manufacturers [3].

I created issue with corresponding Linux messages and output of acpidump 
attached for more devices I have access to:

1.  Linux warning `usb: port power management may be unreliable` on Dell 
OptiPlex 3620
     https://bugzilla.kernel.org/show_bug.cgi?id=218486

2.  Linux warning `usb: port power management may be unreliable` on Dell 
OptiPlex 5055
     https://bugzilla.kernel.org/show_bug.cgi?id=218487

3.  Linux warning `usb: port power management may be unreliable` on 
OptiPlex Small Form Factor Plus 7010
     https://bugzilla.kernel.org/show_bug.cgi?id=218488

4.  Linux warning `usb: port power management may be unreliable` on Dell 
PowerEdge T440
     https://bugzilla.kernel.org/show_bug.cgi?id=218490

(Artem (Cc:) marked them all as duplicates, and I asked him privately to 
undo this until the maintainers ask me to.)

Mathias was so kind to analyze the ACPI tables [2].

Is this a firmware issue or a Linux one? As a user I am unsure what to 
do, and ignoring warnings sounds wrong to me.


Kind regards,

Paul


[1]: 
https://lore.kernel.org/linux-usb/210f8e5d-aa78-41f7-a9ce-2584274f1848@molgen.mpg.de/T/#t
[2]: https://bugzilla.kernel.org/show_bug.cgi?id=218465
      "Linux warning `usb: port power management may be unreliable` on 
Dell XPS 13 9360"
[3]: https://github.com/linuxhw/Dmesg


PS: First 100 hits in the Linux messages git archive [3]:

```
linux-hardware-dmesg (main)$ git grep "ay be unreliable" | head -100
All In 
One/AIO/H87/H87H3-TI/C951D8E52EFC/LINUXMINT-20.2/5.4.0-100-GENERIC/X86_64/40CE8C87CB:[ 
    0.650585] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 22 
V222UA/9F8A84B648C2/ENDLESS-3.4.1/4.15.0-22-GENERIC/X86_64/E0EF808E3F:[ 
   0.550937] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_A6521FA/262E2C088492/RED-OS-7.3.2/5.15.72-1.EL7.3.X86_64/X86_64/24ED481783:[ 
    0.522930] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/226F591F8280/ENDLESS-3.8.6/5.4.0-42-GENERIC/X86_64/0EA91E4E6B:[ 
    0.863317] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/226F591F8280/ENDLESS-3.9.1/5.8.0-14-GENERIC/X86_64/9A5F760EC7:[ 
    1.375329] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/2332A3C0017B/ENDLESS-3.7.8/5.3.0-28-GENERIC/X86_64/74D86F694A:[ 
    0.833766] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/3602C27EA430/ENDLESS-3.8.4/5.4.0-19-GENERIC/X86_64/2AF0AF630C:[ 
    0.865505] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/3602C27EA430/ENDLESS-3.8.6/5.4.0-42-GENERIC/X86_64/653FDB0EE6:[ 
    0.869166] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/3602C27EA430/ENDLESS-3.9.4/5.8.0-14-GENERIC/X86_64/AB5720591E:[ 
    1.344398] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FA_V241FA/3602C27EA430/ENDLESS-3.9.6/5.8.0-14-GENERIC/X86_64/60C6C7EA7C:[ 
    1.341951] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FF_A6521FF/856843130D4D/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/52140CEEC0:[ 
    1.353997] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FF_A6521FF/856843130D4D/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/702C97C47B:[ 
    1.353997] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FF_V241FF/7000C1D5524B/ENDLESS-3.9.3/5.8.0-14-GENERIC/X86_64/72FCC11E52:[ 
    1.264174] usb: port power management may be unreliable
All In One/ASUSTek Computer/Vivo/Vivo AIO 24 
V241FF_V241FF/B16A1F0445CB/ENDLESS-3.9.4/5.8.0-14-GENERIC/X86_64/A9A286F67B:[ 
    1.347540] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/2C64F2D7482B/ENDLESS-3.3.16-NEXTHW1/4.15.0-12-GENERIC/X86_64/5070ED2282:[ 
    0.665420] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/2C64F2D7482B/ENDLESS-3.3.16-NEXTHW1/4.15.0-12-GENERIC/X86_64/80FF2C9A96:[ 
    0.665420] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/2C64F2D7482B/ENDLESS-3.3.19-NEXTHW1/4.15.0-15-GENERIC/X86_64/191C1A1A94:[ 
    0.664096] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/2C64F2D7482B/ENDLESS-3.3.19-NEXTHW1/4.15.0-15-GENERIC/X86_64/949FF85DC9:[ 
    0.635980] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/2C64F2D7482B/ENDLESS-3.3.19-NEXTHW1/4.15.0-15-GENERIC/X86_64/D633DC9722:[ 
    0.635980] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/2C64F2D7482B/ENDLESS-3.5.1/4.18.0-10-GENERIC/X86_64/B9D07EAAFE:[ 
    0.711346] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/72345B40DF12/OPENMANDRIVA-4.3/5.16.13-DESKTOP-1OMV4003/X86_64/2E0A195007:[ 
    1.915921] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/72345B40DF12/UBUNTU-20.04/5.8.0-53-GENERIC/X86_64/0EF1F4F50D:[ 
  0.887317] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/72345B40DF12/UBUNTU-20.04/5.8.0-53-GENERIC/X86_64/FDC38A2185:[ 
  0.910744] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/76051F2C7080/KDE-NEON-20.04/5.13.0-35-GENERIC/X86_64/D3DB12130F:[ 
    0.927905] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/89FE20662EF5/ENDLESS-3.7.7/5.3.0-28-GENERIC/X86_64/8434301194:[ 
   0.956868] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/A87B47004B14/ENDLESS-3.3.16-NEXTHW1/4.15.0-12-GENERIC/X86_64/C861864ED7:[ 
    0.664109] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/CAE70310F314/ENDLESS-3.9.4/5.8.0-14-GENERIC/X86_64/66808639C4:[ 
   1.510309] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/CAE70310F314/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/207D9F3DF9:[ 
   1.523026] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/CAE70310F314/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/2CC529923F:[ 
   1.506792] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/CAE70310F314/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/70014EA10E:[ 
   1.559157] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-865/CAE70310F314/UBUNTU/5.8.0-14-GENERIC/X86_64/E51EF67C3C:[ 
1.509910] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-963/AB390A2C3656/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/30F1B16098:[ 
   1.109351] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C22-963/AB390A2C3656/ENDLESS-3.9.5/5.8.0-14-GENERIC/X86_64/9AC8D3D065:[ 
   1.109351] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-420/1D8955841971/ENDLESS-3.9.7/5.8.0-14-GENERIC/X86_64/04C483EE9B:[ 
   2.836153] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-860/422CCDC0D82D/OPENMANDRIVA-23.01/6.1.1-DESKTOP-1OMV2290/X86_64/AB25618998:[ 
    2.517040] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-860/521E90F01878/ENDLESS-3.9.3/5.8.0-14-GENERIC/X86_64/EE48661CED:[ 
   1.771622] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/186914CED252/KUBUNTU-19.10/5.3.0-29-GENERIC/X86_64/4EC6B3F5DC:[ 
   0.619494] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/186914CED252/KUBUNTU-19.10/5.3.0-29-GENERIC/X86_64/660EA9C3A5:[ 
   0.619494] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/186914CED252/KUBUNTU-20.04/5.4.0-45-GENERIC/X86_64/68D89317DC:[ 
   0.693613] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/186914CED252/KUBUNTU-20.04/5.4.0-45-GENERIC/X86_64/B10A4E5810:[ 
   0.693613] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/21BB50F83EA2/FEDORA-34/5.11.15-300.FC34.X86_64/X86_64/EB23862DED:[ 
    0.729864] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/42C297513CDB/UBUNTU-19.04/5.0.0-16-GENERIC/X86_64/2288828F06:[ 
  0.919194] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/AD00670C5A58/ROSA-12.2/5.10.74-GENERIC-2ROSA2021.1-X86_64/X86_64/873C58A401:[ 
    2.316468] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/AD00670C5A58/ROSA-12.2/5.10.74-GENERIC-2ROSA2021.1-X86_64/X86_64/961F1373A2:[ 
    2.336592] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/AD00670C5A58/ROSA-12.2/5.10.74-GENERIC-2ROSA2021.1-X86_64/X86_64/E61762236D:[ 
    2.361173] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-865/C6582B079E94/OPENMANDRIVA-4.2/5.10.14-DESKTOP-1OMV4002/X86_64/6DC98B8074:[ 
    1.787340] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/77A9AFE95967/ENDLESS-3.7.6/5.3.0-23-GENERIC/X86_64/D8FFD8A934:[ 
   0.823592] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/CC4A926A8703/ROSA-12/5.10.71-GENERIC-1ROSA2021.1-X86_64/X86_64/9B4659E4DD:[ 
    2.473583] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/CC4A926A8703/ROSA-R12/5.10.56-GENERIC-1ROSA2021.1-X86_64/X86_64/01D4780C32:[ 
    2.450866] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/CC4A926A8703/ROSA-R12/5.10.70-GENERIC-2ROSA2021.1-X86_64/X86_64/215146C423:[ 
    2.455238] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/CCB33D17B7C6/ZORIN-16/5.15.0-53-GENERIC/X86_64/4F517E816D:[ 
1.017371] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/CCB33D17B7C6/ZORIN-16/5.15.0-56-GENERIC/X86_64/AB421FD2D4:[ 
0.625572] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C24-963/E4A4E93BCF0A/RED-OS-7.3/5.15.87-1.EL7.3.X86_64/X86_64/7B4EEEBDBC:[ 
    0.724577] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-1655/38F1D8798E6E/RED-OS-7.3.2/5.15.87-1.EL7.3.X86_64/X86_64/4FE6CA7F88:[ 
    0.751172] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-1655/AA5A69D17335/ALT-8.4/5.10.110-STD-DEF-ALT0.C9F.2/X86_64/96E5D68181:[ 
    0.947771] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-1655/F58A44B9C206/UBUNTUSTUDIO-20.04/5.13.0-40-LOWLATENCY/X86_64/AFF1557D72:[ 
    0.741138] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-1655/F58A44B9C206/UBUNTUSTUDIO-20.04/5.17.1-051701-GENERIC/X86_64/A87F9DE14E:[ 
    0.799120] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/0BC43D485BC1/ENDLESS-3.8.7/5.4.0-42-GENERIC/X86_64/087592F760:[ 
   1.824861] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/0BC43D485BC1/ENDLESS-3.8.7/5.4.0-42-GENERIC/X86_64/0FD8D844C5:[ 
   1.834120] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/0BC43D485BC1/ENDLESS-3.8.7/5.4.0-42-GENERIC/X86_64/AB58D02A20:[ 
   1.821996] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/0BC43D485BC1/ENDLESS-3.8.7/5.4.0-42-GENERIC/X86_64/CC29336BB3:[ 
   1.824861] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/0D6785EE4B93/OPENMANDRIVA-23.01/6.1.1-DESKTOP-1OMV2290/X86_64/D801E40F8C:[ 
    1.758023] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/405BF25F53D1/KUBUNTU-20.04/5.4.0-47-GENERIC/X86_64/679E8852DF:[ 
   0.854000] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/563F493FD77F/OPENMANDRIVA-23.03/6.2.6-DESKTOP-1OMV2390/X86_64/A82A90955E:[ 
    1.415729] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/563F493FD77F/OPENMANDRIVA-4.90/5.18.12-DESKTOP-3OMV4090/X86_64/F8A944DF6F:[ 
    1.441382] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/93EEE25E2034/ENDLESS-3.8.6/5.4.0-42-GENERIC/X86_64/BF2053E277:[ 
   1.560914] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/93EEE25E2034/ENDLESS-3.9.0/5.8.0-14-GENERIC/X86_64/B886538A18:[ 
   1.895375] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/93EEE25E2034/ENDLESS-3.9.3/5.8.0-14-GENERIC/X86_64/17E53BFE31:[ 
   1.910578] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/93EEE25E2034/ENDLESS-3.9.3/5.8.0-14-GENERIC/X86_64/5820A2D4C3:[ 
   1.899581] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/A23104408196/LINUXMINT-20.3/5.4.0-92-GENERIC/X86_64/F15CA34264:[ 
    1.090331] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
C27-962/AAB4DC68AC2E/ENDEAVOUROS-ROLLING/5.13.4-ARCH2-1/X86_64/75E1D7295C:[ 
    1.095398] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
S24-880/00A232C06A58/OPENMANDRIVA-4.50/5.19.12-DESKTOP-2OMV4090/X86_64/A255155F98:[ 
    1.709588] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
V3-772G/D65C7FD04328/ARCH-ROLLING/5.9.4-ARCH1-1/X86_64/63B708B27B:[ 
3.102833] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z1-622/12DC70B153E8/ROSA-2016.1/4.9.60-NRJ-DESKTOP-1ROSA-X86_64/X86_64/350CC83AC7:[ 
    6.340598] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z1-751/6ED6D0CF15D0/UBUNTU-20.04/5.8.0-48-GENERIC/X86_64/088EE04D43:[ 
1.603326] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z1-751/6ED6D0CF15D0/UBUNTU-20.04/5.8.0-50-GENERIC/X86_64/6CCA1F0784:[ 
1.602219] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z24-890/BC3051D49BF1/UBUNTU-16.04/4.4.0-177-GENERIC/X86_64/C1339E884A:[ 
   0.846488] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z3-600/BD66BD02AA7B/OPENMANDRIVA-23.03/6.2.6-DESKTOP-1OMV2390/X86_64/A2921975CD:[ 
    5.353925] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z3-600/C4DD4E20E239/UBUNTU-18.04/5.0.0-37-GENERIC/X86_64/95465E168F:[ 
1.739941] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
Z3-705/160DDCD6E651/ROSA-2014.1/4.1.25-NRJ-DESKTOP-1ROSA-X86_64/X86_64/E7395D0EE2:[ 
    1.422223] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
ZC-606/4574857FD00B/UBUNTU-20.04/5.11.0-40-GENERIC/X86_64/2972DF8D64:[ 
  1.854473] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
ZC-606/F618C756E258/ROSA-2016.1/4.9.60-NRJ-DESKTOP-1ROSA-X86_64/X86_64/7048174273:[ 
    4.917425] usb: port power management may be unreliable
All In One/Acer/Aspire/Aspire 
ZC-606/F618C756E258/ROSA-2016.1/4.9.76-NRJ-DESKTOP-1ROSA-X86_64/X86_64/90FF435FAD:[ 
    4.069505] usb: port power management may be unreliable
All In One/Acer/Veriton/Veriton 
Z4810G/E8AB5315A5E7/UBUNTU-20.04/5.15.0-43-GENERIC/X86_64/D85C47C623:[ 
  0.701649] usb: port power management may be unreliable
All In One/Acer/Veriton/Veriton 
Z4810G/E8AB5315A5E7/UBUNTU-22.04/5.19.0-38-GENERIC/X86_64/C4A9881345:[ 
  1.198923] usb: port power management may be unreliable
All In 
One/Acidanthera/iMac16/iMac16,1/594881FEE753/OPENMANDRIVA-4.50/5.19.5-DESKTOP-1OMV4090/X86_64/0E9B82F312:[ 
    3.930212] usb: port power management may be unreliable
All In 
One/Acidanthera/iMac18/iMac18,3/5F24E52E7730/LINUXMINT-21.1/5.15.0-58-GENERIC/X86_64/70BD257F2C:[ 
    1.259378] usb: port power management may be unreliable
All In 
One/Acidanthera/iMac18/iMac18,3/5F24E52E7730/LINUXMINT-21/5.15.0-56-GENERIC/X86_64/405443FC24:[ 
    1.273375] usb: port power management may be unreliable
All In 
One/Acidanthera/iMac18/iMac18,3/5F24E52E7730/LINUXMINT-21/5.15.0-56-GENERIC/X86_64/AEFCE63130:[ 
    1.308855] usb: port power management may be unreliable
All In 
One/Acidanthera/iMac20/iMac20,1/1EB5BA2AB9E0/ELEMENTARY-6.1/5.15.0-56-GENERIC/X86_64/4EFE19137D:[ 
    0.742582] usb: port power management may be unreliable
All In 
One/Acidanthera/iMacPro1/iMacPro1,1/2499D9B10F2B/NOBARA-37/6.2.6-201.FSYNC.FC37.X86_64/X86_64/EBA8868F8B:[ 
    1.095741] usb: port power management may be unreliable
All In 
One/Acidanthera/iMacPro1/iMacPro1,1/9A30E1010885/ARCH/5.9.10-ARCH1-1/X86_64/42B182D5F0:[ 
    3.612607] usb: port power management may be unreliable
All In 
One/Acidanthera/iMacPro1/iMacPro1,1/BF28891431B4/UBUNTU-20.04/5.4.0-37-GENERIC/X86_64/FC4BF98DC2:[ 
    0.288941] usb: port power management may be unreliable
All In 
One/Acidanthera/iMacPro1/iMacPro1,1/CCEF88A1D848/UBUNTU-22.04/5.19.0-32-GENERIC/X86_64/13A42307A4:[ 
    1.950960] usb: port power management may be unreliable
All In 
One/Apple/iMac16/iMac16,1/36F3548CFB1A/ROSA-2016.1/4.9.41-NRJ-DESKTOP-1ROSA-X86_64/X86_64/A90AA5D34B:[ 
    2.869734] usb: port power management may be unreliable
All In 
One/Apple/iMac16/iMac16,1/4BCFE045F418/POP!_OS-21.04/5.13.0-7620-GENERIC/X86_64/6514199D0C:[ 
    1.080389] usb: port power management may be unreliable
All In 
One/Apple/iMac16/iMac16,1/8D6EBF97728F/ROSA-2016.1/4.15.0-DESKTOP-47.2ROSA-X86_64/X86_64/906BCD4AC8:[ 
    1.526534] usb: port power management may be unreliable
All In 
One/Apple/iMac16/iMac16,1/B46A60C60F7F/OPENMANDRIVA-4.50/5.12.4-DESKTOP-1OMV4050/X86_64/F800A67D4D:[ 
    2.784742] usb: port power management may be unreliable
All In 
One/Apple/iMac16/iMac16,1/E5DA8CE02497/LINUXMINT-20.2/5.4.0-89-GENERIC/X86_64/14FA707392:[ 
    0.844179] usb: port power management may be unreliable
All In 
One/Apple/iMac16/iMac16,1/E5DA8CE02497/LINUXMINT-20.2/5.4.0-89-GENERIC/X86_64/9FE896D123:[ 
    0.844179] usb: port power management may be unreliable
```

