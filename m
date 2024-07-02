Return-Path: <linux-usb+bounces-11837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1449249E4
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 23:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E601C2233B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 21:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC2020127F;
	Tue,  2 Jul 2024 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b="aUzH3vzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DF201272
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 21:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719955369; cv=none; b=IO5QSIoY4sE09SRDOOexjYFqzoeYBrkFYx6wigJlBviCihu/iBmp4MTwlNQWOhOW3UagSBW3WN0yRaD+QsDXkkRFPnWp8vWuv8ZcfDSOJnrglHzhZJ92nixEKruH5Gb//CovWBASOx2NYIbWDSDwrhkeddfuGarZYQmblY4EO5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719955369; c=relaxed/simple;
	bh=9XQ/XFucmvXQsChb0lxuW9xBaIZyh+Ul+/PYTdKXJxk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bANWTiCPzKuOz2A9azwI/1l478MAuV6qBShVhWyk5kSDR/bH+YE6MLOTb2ZobhXO5UWLeW04Q4YovHL/j66RGVl8GqA4qb6xb8QCH8HmdxOBewR/WKETvK1NFKQ028hh31OIa1nVuZA9DpoJXN0bQPGk3PY5kcCwOfgBeWVOwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br; spf=pass smtp.mailfrom=lsitec.org.br; dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b=aUzH3vzw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsitec.org.br
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e829086f3so5006791e87.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2024 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lsitec.org.br; s=google; t=1719955364; x=1720560164; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=85DvFvtf7/GmIiQVSW202ysBkpsRBMOZmG/3K6FvFnk=;
        b=aUzH3vzwg//wAERRX9V30xNnfFQ5URWuIbYXhFfww+Mfbmagajj3PBD4VvQ9932Aqj
         xwUgDXvAIgQubsl6ADwGlGAziC7yN3QyO5rKdanqYPVDbAeFQAEpsCP7xjh1jspx3nDf
         XCHhEvoPOeF/MS2Vcj76G7r+XlroKaMMu526UNWYybDPqucrxEpdBXCRhSvTwvAdMgnZ
         KaA3qBfozPAJCY88ZAoj6dSIRoQ3W2U2IzkZNDICAIh/wMHzg8jUoVh+3p8sCH3gpLiK
         MWeUNN2AhrOgVUs735hRsOiQbck/VSwhtZYAdz+9ArARC+hovQsE0qHUQ2tqVw3myQjc
         buuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719955364; x=1720560164;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85DvFvtf7/GmIiQVSW202ysBkpsRBMOZmG/3K6FvFnk=;
        b=tqPmJFtAeiK/tIL6OtYNUgjx9tspoaml7nRfCNp0FlBfaEMtNFj8oC8Sr1jfuKoFYq
         cAVRER56GQcmT+nZjqLZ5gd0ZQpRBglmyE+bDMMmKqCU3LJlCn7eqLMSWbRRK61VSMEO
         GbGM2ARDmbsUgy/06gpXpHVG67Lt9EBcgx0rf1GvAcx5H7FIcLjF9365rGNES+R4xe+t
         laIwqthzrbVD5H1sAfiSlDZ8JwDy26Awzibet1GWpmB8CNGKQq9yWKVzpDf2coalsquR
         uxd9Sf8MZPvFpOf8kcGnGpPGArj0QCJ11XO9hDwNU5ggV/aneqR4XNvK+MTbgtzyzGWR
         Z7uw==
X-Forwarded-Encrypted: i=1; AJvYcCVeuIYB/Kxy3fuTZknnivVovBOcGDEluZvZyQOjtHppHug17/bcRibIOnYaKZXpPmYDYDoyoInEQia3lXfozupH00zNQxQVW6LL
X-Gm-Message-State: AOJu0YywHl1vnV3mSbsQy3JZbjjE9M5UhkwO5tJfQgv3ZqvphukQCzWl
	mhcFeG6b09NgAEXCSwsF2ugoI4uJs37wPviYvTlravOHdNLG3RNeN2dci9K38JC+X08o+UCfPah
	XHuatfJAfRgs6IGrT/02qHymo6aw4kAEukDRkciI6wdGVSYSr3fcp
X-Google-Smtp-Source: AGHT+IHVvWDPRQyGw3UKDi/vgI3K0IGB9FFqk0/fgGIM0bX7JUiaZU+OJ5MvbGPtyn5TAvzJNBBz5UQpbKCxcsa6UR8=
X-Received: by 2002:a05:6512:33c8:b0:52c:c9b6:df0f with SMTP id
 2adb3069b0e04-52e82733f9dmr6420668e87.61.1719955363661; Tue, 02 Jul 2024
 14:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ana Clara Forcelli <ana.forcelli@lsitec.org.br>
Date: Tue, 2 Jul 2024 18:22:31 -0300
Message-ID: <CALWWSVGAg_4hW-a-SHFvQQ1N2A7jjTQpfO34fRUWdfR6N43ZRA@mail.gmail.com>
Subject: Issues while implementing Designware DWC3 on an Actions S700 chip.
To: felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007b3f7a061c4a5055"

--0000000000007b3f7a061c4a5055
Content-Type: multipart/alternative; boundary="0000000000007b3f78061c4a5053"

--0000000000007b3f78061c4a5053
Content-Type: text/plain; charset="UTF-8"

Greetings!

I've come to you because I stumbled upon an impasse while attempting to
make the USB3 device work in my company's custom SBC project, which uses
Actions Semiconductor's S700 SoC.

*First, the context:* since the chip was discontinued, the manufacturer
stopped updating the kernel source, so it was stuck in version 3.something.
The USB3 subsystem used to work with the manufacturer's code at that point,
but so many new features were added to the mainline that we had to move on
to newer versions.

Right now, we are using Debian's patched version of the 6.1.76 kernel. Our
repo is public at github.com/caninos-loucos/labrador-linux-6 . We
implemented the device tree nodes, glue layer and PHY code on the usb3
branch. Some code is from the old repo (the phys especially), some was
adapted to the more modern format.

*The problem: *Only a few devices (keyboard, mouse and some pendrives) work
correctly using the usb3 port, and only when they are connected before the
modules load. Otherwise, the device stops at the stop endpoint  command and
the whole XHCI module dies. I tried to debug using the guide at
kernel.org/doc/html/latest/driver-api/usb/dwc3.html
<https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html>, but I
was quickly overwhelmed by how complex this system is. I followed the
commands

# mkdir -p /d# mkdir -p /t# mount -t debugfs none /d# mount -t tracefs
none /t# echo 81920 > /t/buffer_size_kb# echo 1 >
/t/events/dwc3/enable

# cp /t/trace /root/trace.txt# cat /d/*usb*/*dwc3*/regdump >
/root/regdump.txt <--- this had to be modified

but tracefs returned nothing from dwc3 and the regdump is incomprehensible
to me, since I don't have access to the IP handbook. I tried more ways to
access the trace, and even enabled all functions, but I'm mostly sure that
the aforementioned command works just fine.

The regdump.txt file attached to this email shows the dump after connecting
a generic USB pendrive and waiting for the dmesg output:
[   90.800444] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop
endpoint command
[   90.828621] xhci-hcd xhci-hcd.0.auto: xHCI host controller not
responding, assume dead
[   90.836534] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[   90.842256] usb usb3-port1: couldn't allocate usb_device

Can you guys lend me a hand?

Many thanks!

Ana Clara Forcelli
Firmware Developer at Caninos Loucos - LSI-TEC

--0000000000007b3f78061c4a5053
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings!</div><div><br></div><div>I&#39;ve come to =
you because I stumbled upon an impasse while attempting to make the USB3 de=
vice work in my company&#39;s custom SBC project, which uses Actions Semico=
nductor&#39;s S700 SoC.<br></div><div><br></div><div><b>First, the context:=
</b> since the chip was discontinued, the manufacturer stopped updating the=
 kernel source, so it was stuck in version 3.something. The USB3 subsystem =
used to work with the manufacturer&#39;s code at that point, but so many ne=
w features were added to the mainline that we had to move on to newer versi=
ons. <br></div><div><br></div><div>Right now, we are using Debian&#39;s pat=
ched version of the 6.1.76 kernel. Our repo is public at <a href=3D"http://=
github.com/caninos-loucos/labrador-linux-6">github.com/caninos-loucos/labra=
dor-linux-6</a> . We implemented the device tree nodes, glue layer and PHY =
code on the usb3 branch. Some code is from the old repo (the phys especiall=
y), some was adapted to the more modern format. <br></div><div><br></div><d=
iv><b>The problem: </b>Only a few devices (keyboard, mouse and some pendriv=
es) work correctly using the usb3 port, and only when they are connected be=
fore the modules load. Otherwise, the device stops at the stop endpoint=C2=
=A0 command and the whole XHCI module dies. I tried to debug using the guid=
e at <a href=3D"https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.=
html">kernel.org/doc/html/latest/driver-api/usb/dwc3.html</a>, but I was qu=
ickly overwhelmed by how complex this system is. I followed the commands=C2=
=A0<div class=3D"gmail-highlight-sh gmail-notranslate"><div class=3D"gmail-=
highlight"><pre><span class=3D"gmail-c1"># mkdir -p /d</span>
<span class=3D"gmail-c1"># mkdir -p /t</span>
<span class=3D"gmail-c1"># mount -t debugfs none /d</span>
<span class=3D"gmail-c1"># mount -t tracefs none /t</span>
<span class=3D"gmail-c1"># echo 81920 &gt; /t/buffer_size_kb</span>
<span class=3D"gmail-c1"># echo 1 &gt; /t/events/dwc3/enable</span>
</pre></div></div><div class=3D"gmail-highlight-sh gmail-notranslate"><div =
class=3D"gmail-highlight"><pre><span></span><span class=3D"gmail-c1"># cp /=
t/trace /root/trace.txt</span>
<span class=3D"gmail-c1"># cat /d/<b>usb</b>/*dwc3*/regdump &gt; /root/regd=
ump.txt</span> &lt;--- this had to be modified
</pre></div>
</div>but tracefs returned nothing from dwc3 and the regdump is incomprehen=
sible to me, since I don&#39;t have access to the IP handbook. I tried more=
 ways to access the trace, and even enabled all functions, but I&#39;m most=
ly sure that the aforementioned command works just fine.</div><div><br></di=
v><div>The regdump.txt file attached to this email shows the dump after con=
necting a generic USB pendrive and waiting for the dmesg output:</div><div>=
<span style=3D"font-family:monospace">[ =C2=A0 90.800444] xhci-hcd xhci-hcd=
.0.auto: xHCI host not responding to stop endpoint command<br>[ =C2=A0 90.8=
28621] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assum=
e dead<br>[ =C2=A0 90.836534] xhci-hcd xhci-hcd.0.auto: HC died; cleaning u=
p<br>[ =C2=A0 90.842256] usb usb3-port1: couldn&#39;t allocate usb_device</=
span></div><div><br></div><div>Can you guys lend me a hand? <br></div><div>=
<br></div><div>Many thanks! <br></div><div><br></div><div>Ana Clara Forcell=
i</div><div>Firmware Developer at Caninos Loucos - LSI-TEC<br></div></div>

--0000000000007b3f78061c4a5053--
--0000000000007b3f7a061c4a5055
Content-Type: text/plain; charset="US-ASCII"; name="regdump2.txt"
Content-Disposition: attachment; filename="regdump2.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_ly4w0bqh0>
X-Attachment-Id: f_ly4w0bqh0

R1NCVVNDRkcwID0gMHgwMDAwMDAwOApHU0JVU0NGRzEgPSAweDAwMDAwZjAwCkdUWFRIUkNGRyA9
IDB4MDAwMDAwMDAKR1JYVEhSQ0ZHID0gMHgwMDAwMDAwMApHQ1RMID0gMHgzMGMxMTQwMQpHRVZU
RU4gPSAweDAwMDAwMDAwCkdTVFMgPSAweDNlODAwMDAyCkdVQ1RMMSA9IDB4MDAwMDAwMDAKR1NO
UFNJRCA9IDB4NTUzMzI0MGEKR0dQSU8gPSAweDAwMDAwMDAwCkdVSUQgPSAweDAwMDYwMTRjCkdV
Q1RMID0gMHgwMjAwODAxMApHQlVTRVJSQUREUjAgPSAweDAwMDAwMDAwCkdCVVNFUlJBRERSMSA9
IDB4MDAwMDAwMDAKR1BSVEJJTUFQMCA9IDB4MDAwMDAwMDAKR1BSVEJJTUFQMSA9IDB4MDAwMDAw
MDAKR0hXUEFSQU1TMCA9IDB4MjAyMDQwMGEKR0hXUEFSQU1TMSA9IDB4ODFlMGM5MTgKR0hXUEFS
QU1TMiA9IDB4MDAwNTIxMWEKR0hXUEFSQU1TMyA9IDB4MDUxNGEwODUKR0hXUEFSQU1TNCA9IDB4
NDg4MjIwMDgKR0hXUEFSQU1TNSA9IDB4MDQyMDIwODgKR0hXUEFSQU1TNiA9IDB4MDc2ZTgwMjAK
R0hXUEFSQU1TNyA9IDB4MDMwODA1NTAKR0RCR0ZJRk9TUEFDRSA9IDB4MDA4MjAwMDAKR0RCR0xU
U1NNID0gMHgwMTU1MDQ2MgpHREJHQk1VID0gMHgyMDMwMDAxMApHUFJUQklNQVBfSFMwID0gMHgw
MDAwMDAwMApHUFJUQklNQVBfSFMxID0gMHgwMDAwMDAwMApHUFJUQklNQVBfRlMwID0gMHgwMDAw
MDAwMApHUFJUQklNQVBfRlMxID0gMHgwMDAwMDAwMApHVVNCMlBIWUNGRygwKSA9IDB4MDAwMDI1
NDgKR1VTQjJQSFlDRkcoMSkgPSAweDAwMDAwMDAwCkdVU0IyUEhZQ0ZHKDIpID0gMHgwMDAwMDAw
MApHVVNCMlBIWUNGRygzKSA9IDB4MDAwMDAwMDAKR1VTQjJQSFlDRkcoNCkgPSAweDAwMDAwMDAw
CkdVU0IyUEhZQ0ZHKDUpID0gMHgwMDAwMDAwMApHVVNCMlBIWUNGRyg2KSA9IDB4MDAwMDAwMDAK
R1VTQjJQSFlDRkcoNykgPSAweDAwMDAwMDAwCkdVU0IyUEhZQ0ZHKDgpID0gMHgwMDAwMDAwMApH
VVNCMlBIWUNGRyg5KSA9IDB4MDAwMDAwMDAKR1VTQjJQSFlDRkcoMTApID0gMHgwMDAwMDAwMApH
VVNCMlBIWUNGRygxMSkgPSAweDAwMDAwMDAwCkdVU0IyUEhZQ0ZHKDEyKSA9IDB4MDAwMDAwMDAK
R1VTQjJQSFlDRkcoMTMpID0gMHgwMDAwMDAwMApHVVNCMlBIWUNGRygxNCkgPSAweDAwMDAwMDAw
CkdVU0IyUEhZQ0ZHKDE1KSA9IDB4MDAwMDAwMDAKR1VTQjJJMkNDVEwoMCkgPSAweDAwMDAwMDAw
CkdVU0IySTJDQ1RMKDEpID0gMHgwMDAwMDAwMApHVVNCMkkyQ0NUTCgyKSA9IDB4MDAwMDAwMDAK
R1VTQjJJMkNDVEwoMykgPSAweDAwMDAwMDAwCkdVU0IySTJDQ1RMKDQpID0gMHgwMDAwMDAwMApH
VVNCMkkyQ0NUTCg1KSA9IDB4MDAwMDAwMDAKR1VTQjJJMkNDVEwoNikgPSAweDAwMDAwMDAwCkdV
U0IySTJDQ1RMKDcpID0gMHgwMDAwMDAwMApHVVNCMkkyQ0NUTCg4KSA9IDB4MDAwMDAwMDAKR1VT
QjJJMkNDVEwoOSkgPSAweDAwMDAwMDAwCkdVU0IySTJDQ1RMKDEwKSA9IDB4MDAwMDAwMDAKR1VT
QjJJMkNDVEwoMTEpID0gMHgwMDAwMDAwMApHVVNCMkkyQ0NUTCgxMikgPSAweDAwMDAwMDAwCkdV
U0IySTJDQ1RMKDEzKSA9IDB4MDAwMDAwMDAKR1VTQjJJMkNDVEwoMTQpID0gMHgwMDAwMDAwMApH
VVNCMkkyQ0NUTCgxNSkgPSAweDAwMDAwMDAwCkdVU0IyUEhZQUNDKDApID0gMHgwMDAwMDAwMApH
VVNCMlBIWUFDQygxKSA9IDB4MDAwMDAwMDAKR1VTQjJQSFlBQ0MoMikgPSAweDAwMDAwMDAwCkdV
U0IyUEhZQUNDKDMpID0gMHgwMDAwMDAwMApHVVNCMlBIWUFDQyg0KSA9IDB4MDAwMDAwMDAKR1VT
QjJQSFlBQ0MoNSkgPSAweDAwMDAwMDAwCkdVU0IyUEhZQUNDKDYpID0gMHgwMDAwMDAwMApHVVNC
MlBIWUFDQyg3KSA9IDB4MDAwMDAwMDAKR1VTQjJQSFlBQ0MoOCkgPSAweDAwMDAwMDAwCkdVU0Iy
UEhZQUNDKDkpID0gMHgwMDAwMDAwMApHVVNCMlBIWUFDQygxMCkgPSAweDAwMDAwMDAwCkdVU0Iy
UEhZQUNDKDExKSA9IDB4MDAwMDAwMDAKR1VTQjJQSFlBQ0MoMTIpID0gMHgwMDAwMDAwMApHVVNC
MlBIWUFDQygxMykgPSAweDAwMDAwMDAwCkdVU0IyUEhZQUNDKDE0KSA9IDB4MDAwMDAwMDAKR1VT
QjJQSFlBQ0MoMTUpID0gMHgwMDAwMDAwMApHVVNCM1BJUEVDVEwoMCkgPSAweDAxMGUwMjAyCkdV
U0IzUElQRUNUTCgxKSA9IDB4MDAwMDAwMDAKR1VTQjNQSVBFQ1RMKDIpID0gMHgwMDAwMDAwMApH
VVNCM1BJUEVDVEwoMykgPSAweDAwMDAwMDAwCkdVU0IzUElQRUNUTCg0KSA9IDB4MDAwMDAwMDAK
R1VTQjNQSVBFQ1RMKDUpID0gMHgwMDAwMDAwMApHVVNCM1BJUEVDVEwoNikgPSAweDAwMDAwMDAw
CkdVU0IzUElQRUNUTCg3KSA9IDB4MDAwMDAwMDAKR1VTQjNQSVBFQ1RMKDgpID0gMHgwMDAwMDAw
MApHVVNCM1BJUEVDVEwoOSkgPSAweDAwMDAwMDAwCkdVU0IzUElQRUNUTCgxMCkgPSAweDAwMDAw
MDAwCkdVU0IzUElQRUNUTCgxMSkgPSAweDAwMDAwMDAwCkdVU0IzUElQRUNUTCgxMikgPSAweDAw
MDAwMDAwCkdVU0IzUElQRUNUTCgxMykgPSAweDAwMDAwMDAwCkdVU0IzUElQRUNUTCgxNCkgPSAw
eDAwMDAwMDAwCkdVU0IzUElQRUNUTCgxNSkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooMCkgPSAw
eDAwMDAwMDgyCkdUWEZJRk9TSVooMSkgPSAweDAwODIwMTAzCkdUWEZJRk9TSVooMikgPSAweDAx
ODUwMjA1CkdUWEZJRk9TSVooMykgPSAweDAzOGEwMDIyCkdUWEZJRk9TSVooNCkgPSAweDAzYWMw
MDAwCkdUWEZJRk9TSVooNSkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooNikgPSAweDAwMDAwMDAw
CkdUWEZJRk9TSVooNykgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooOCkgPSAweDAwMDAwMDAwCkdU
WEZJRk9TSVooOSkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooMTApID0gMHgwMDAwMDAwMApHVFhG
SUZPU0laKDExKSA9IDB4MDAwMDAwMDAKR1RYRklGT1NJWigxMikgPSAweDAwMDAwMDAwCkdUWEZJ
Rk9TSVooMTMpID0gMHgwMDAwMDAwMApHVFhGSUZPU0laKDE0KSA9IDB4MDAwMDAwMDAKR1RYRklG
T1NJWigxNSkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooMTYpID0gMHgwMDAwMDAwMApHVFhGSUZP
U0laKDE3KSA9IDB4MDAwMDAwMDAKR1RYRklGT1NJWigxOCkgPSAweDAwMDAwMDAwCkdUWEZJRk9T
SVooMTkpID0gMHgwMDAwMDAwMApHVFhGSUZPU0laKDIwKSA9IDB4MDAwMDAwMDAKR1RYRklGT1NJ
WigyMSkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooMjIpID0gMHgwMDAwMDAwMApHVFhGSUZPU0la
KDIzKSA9IDB4MDAwMDAwMDAKR1RYRklGT1NJWigyNCkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVoo
MjUpID0gMHgwMDAwMDAwMApHVFhGSUZPU0laKDI2KSA9IDB4MDAwMDAwMDAKR1RYRklGT1NJWigy
NykgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooMjgpID0gMHgwMDAwMDAwMApHVFhGSUZPU0laKDI5
KSA9IDB4MDAwMDAwMDAKR1RYRklGT1NJWigzMCkgPSAweDAwMDAwMDAwCkdUWEZJRk9TSVooMzEp
ID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDApID0gMHgwMDAwMDA4NApHUlhGSUZPU0laKDEpID0g
MHgwMDg0MDEwNApHUlhGSUZPU0laKDIpID0gMHgwMTg4MDE4MApHUlhGSUZPU0laKDMpID0gMHgw
MDAwMDAwMApHUlhGSUZPU0laKDQpID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDUpID0gMHgwMDAw
MDAwMApHUlhGSUZPU0laKDYpID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDcpID0gMHgwMDAwMDAw
MApHUlhGSUZPU0laKDgpID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDkpID0gMHgwMDAwMDAwMApH
UlhGSUZPU0laKDEwKSA9IDB4MDAwMDAwMDAKR1JYRklGT1NJWigxMSkgPSAweDAwMDAwMDAwCkdS
WEZJRk9TSVooMTIpID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDEzKSA9IDB4MDAwMDAwMDAKR1JY
RklGT1NJWigxNCkgPSAweDAwMDAwMDAwCkdSWEZJRk9TSVooMTUpID0gMHgwMDAwMDAwMApHUlhG
SUZPU0laKDE2KSA9IDB4MDAwMDAwMDAKR1JYRklGT1NJWigxNykgPSAweDAwMDAwMDAwCkdSWEZJ
Rk9TSVooMTgpID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDE5KSA9IDB4MDAwMDAwMDAKR1JYRklG
T1NJWigyMCkgPSAweDAwMDAwMDAwCkdSWEZJRk9TSVooMjEpID0gMHgwMDAwMDAwMApHUlhGSUZP
U0laKDIyKSA9IDB4MDAwMDAwMDAKR1JYRklGT1NJWigyMykgPSAweDAwMDAwMDAwCkdSWEZJRk9T
SVooMjQpID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDI1KSA9IDB4MDAwMDAwMDAKR1JYRklGT1NJ
WigyNikgPSAweDAwMDAwMDAwCkdSWEZJRk9TSVooMjcpID0gMHgwMDAwMDAwMApHUlhGSUZPU0la
KDI4KSA9IDB4MDAwMDAwMDAKR1JYRklGT1NJWigyOSkgPSAweDAwMDAwMDAwCkdSWEZJRk9TSVoo
MzApID0gMHgwMDAwMDAwMApHUlhGSUZPU0laKDMxKSA9IDB4MDAwMDAwMDAKR0VWTlRBRFJMTygw
KSA9IDB4MDAwMDAwMDAKR0VWTlRBRFJISSgwKSA9IDB4MDAwMDAwMDAKR0VWTlRTSVooMCkgPSAw
eDAwMDAwMDAwCkdFVk5UQ09VTlQoMCkgPSAweDAwMDAwMDAwCkdIV1BBUkFNUzggPSAweDAwMDAw
NzZlCkRDRkcgPSAweDAwMDgwODA0CkRDVEwgPSAweDAwZjAwMDAwCkRFVlRFTiA9IDB4MDAwMDAw
MDAKRFNUUyA9IDB4MDA1NjAwMDQKREdDTURQQVIgPSAweDAwMDAwMDAwCkRHQ01EID0gMHgwMDAw
MDAwMApEQUxFUEVOQSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMigwKSA9IDB4MDAwMDAwMDAKREVQ
Q01EUEFSMSgwKSA9IDB4MDAwMDAwMDIKREVQQ01EUEFSMCgwKSA9IDB4MGNiNjYwMDEKREVQQ01E
KDApID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDEpID0gMHgwMDAwMDAwMApERVBDTURQQVIxKDEp
ID0gMHgwMDAwMDAwMApERVBDTURQQVIwKDEpID0gMHgwMDAwMDAwMApERVBDTUQoMSkgPSAweDAw
MDAwMDAwCkRFUENNRFBBUjIoMikgPSAweDBjYjY3MDAwCkRFUENNRFBBUjEoMikgPSAweDAwMDAw
MDAwCkRFUENNRFBBUjAoMikgPSAweDAwMDAwMDQwCkRFUENNRCgyKSA9IDB4MDAwMDAwMDAKREVQ
Q01EUEFSMigzKSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgzKSA9IDB4MDAwMDAwMDAKREVQQ01E
UEFSMCgzKSA9IDB4MDAwMDAwMDAKREVQQ01EKDMpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDQp
ID0gMHgwY2I2NDAwMApERVBDTURQQVIxKDQpID0gMHgwMDAwMDAwMApERVBDTURQQVIwKDQpID0g
MHgwY2I2NTA0OApERVBDTUQoNCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjIoNSkgPSAweDAwMDAw
MDAwCkRFUENNRFBBUjEoNSkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoNSkgPSAweDAwMDAwMDAw
CkRFUENNRCg1KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMig2KSA9IDB4MDAwMDAwMDAKREVQQ01E
UEFSMSg2KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMCg2KSA9IDB4MDAwMDAwMDAKREVQQ01EKDYp
ID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDcpID0gMHgwMDAwMDAwMApERVBDTURQQVIxKDcpID0g
MHgwMDAwMDAwMApERVBDTURQQVIwKDcpID0gMHgwMDAwMDAwMApERVBDTUQoNykgPSAweDAwMDAw
MDAwCkRFUENNRFBBUjIoOCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjEoOCkgPSAweDAwMDAwMDAw
CkRFUENNRFBBUjAoOCkgPSAweDAwMDAwMDAwCkRFUENNRCg4KSA9IDB4MDAwMDAwMDAKREVQQ01E
UEFSMig5KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSg5KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFS
MCg5KSA9IDB4MDAwMDAwMDAKREVQQ01EKDkpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDEwKSA9
IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgxMCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMTApID0g
MHgwMDAwMDAwMApERVBDTUQoMTApID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDExKSA9IDB4MDAw
MDAwMDAKREVQQ01EUEFSMSgxMSkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMTEpID0gMHgwMDAw
MDAwMApERVBDTUQoMTEpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDEyKSA9IDB4MDAwMDAwMDAK
REVQQ01EUEFSMSgxMikgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMTIpID0gMHgwMDAwMDAwMApE
RVBDTUQoMTIpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDEzKSA9IDB4MDAwMDAwMDAKREVQQ01E
UEFSMSgxMykgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMTMpID0gMHgwMDAwMDAwMApERVBDTUQo
MTMpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDE0KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgx
NCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMTQpID0gMHgwMDAwMDAwMApERVBDTUQoMTQpID0g
MHgwMDAwMDAwMApERVBDTURQQVIyKDE1KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgxNSkgPSAw
eDAwMDAwMDAwCkRFUENNRFBBUjAoMTUpID0gMHgwMDAwMDAwMApERVBDTUQoMTUpID0gMHgwMDAw
MDAwMApERVBDTURQQVIyKDE2KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgxNikgPSAweDAwMDAw
MDAwCkRFUENNRFBBUjAoMTYpID0gMHgwMDAwMDAwMApERVBDTUQoMTYpID0gMHgwMDAwMDAwMApE
RVBDTURQQVIyKDE3KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgxNykgPSAweDAwMDAwMDAwCkRF
UENNRFBBUjAoMTcpID0gMHgwMDAwMDAwMApERVBDTUQoMTcpID0gMHgwMDAwMDAwMApERVBDTURQ
QVIyKDE4KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgxOCkgPSAweDAwMDAwMDAwCkRFUENNRFBB
UjAoMTgpID0gMHgwMDAwMDAwMApERVBDTUQoMTgpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDE5
KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgxOSkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMTkp
ID0gMHgwMDAwMDAwMApERVBDTUQoMTkpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDIwKSA9IDB4
MDAwMDAwMDAKREVQQ01EUEFSMSgyMCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMjApID0gMHgw
MDAwMDAwMApERVBDTUQoMjApID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDIxKSA9IDB4MDAwMDAw
MDAKREVQQ01EUEFSMSgyMSkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMjEpID0gMHgwMDAwMDAw
MApERVBDTUQoMjEpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDIyKSA9IDB4MDAwMDAwMDAKREVQ
Q01EUEFSMSgyMikgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMjIpID0gMHgwMDAwMDAwMApERVBD
TUQoMjIpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDIzKSA9IDB4MDAwMDAwMDAKREVQQ01EUEFS
MSgyMykgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMjMpID0gMHgwMDAwMDAwMApERVBDTUQoMjMp
ID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDI0KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgyNCkg
PSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMjQpID0gMHgwMDAwMDAwMApERVBDTUQoMjQpID0gMHgw
MDAwMDAwMApERVBDTURQQVIyKDI1KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgyNSkgPSAweDAw
MDAwMDAwCkRFUENNRFBBUjAoMjUpID0gMHgwMDAwMDAwMApERVBDTUQoMjUpID0gMHgwMDAwMDAw
MApERVBDTURQQVIyKDI2KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgyNikgPSAweDAwMDAwMDAw
CkRFUENNRFBBUjAoMjYpID0gMHgwMDAwMDAwMApERVBDTUQoMjYpID0gMHgwMDAwMDAwMApERVBD
TURQQVIyKDI3KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgyNykgPSAweDAwMDAwMDAwCkRFUENN
RFBBUjAoMjcpID0gMHgwMDAwMDAwMApERVBDTUQoMjcpID0gMHgwMDAwMDAwMApERVBDTURQQVIy
KDI4KSA9IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgyOCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAo
MjgpID0gMHgwMDAwMDAwMApERVBDTUQoMjgpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDI5KSA9
IDB4MDAwMDAwMDAKREVQQ01EUEFSMSgyOSkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMjkpID0g
MHgwMDAwMDAwMApERVBDTUQoMjkpID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDMwKSA9IDB4MDAw
MDAwMDAKREVQQ01EUEFSMSgzMCkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMzApID0gMHgwMDAw
MDAwMApERVBDTUQoMzApID0gMHgwMDAwMDAwMApERVBDTURQQVIyKDMxKSA9IDB4MDAwMDAwMDAK
REVQQ01EUEFSMSgzMSkgPSAweDAwMDAwMDAwCkRFUENNRFBBUjAoMzEpID0gMHgwMDAwMDAwMApE
RVBDTUQoMzEpID0gMHgwMDAwMDAwMApPQ0ZHID0gMHgwMDAwMDAwMApPQ1RMID0gMHgwMDAwMDAw
MApPRVZUID0gMHgwMDAwMDAwMApPRVZURU4gPSAweDAwMDAwMDAwCk9TVFMgPSAweDAwMDAwMDAw
Cg==
--0000000000007b3f7a061c4a5055--

