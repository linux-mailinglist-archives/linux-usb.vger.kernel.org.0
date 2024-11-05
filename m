Return-Path: <linux-usb+bounces-17084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE039BC203
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 01:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA5F0282E21
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 00:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1273E555;
	Tue,  5 Nov 2024 00:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJXv1Y9e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0D8F62;
	Tue,  5 Nov 2024 00:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730766668; cv=none; b=fwwDB9HoPb8p6ioOfnmuXBgvwrhurr/Hd3R10cUbhkd+/3VFYwDXsEB2sJF2T4s+11lizsUrHEoPoBAR5lCIlq7E0dOKAspe9ZwhWVDEot41ShJ5J0DLU4Rc3WZD/kPi66qA55m/imEFfmf1QbzQhu89xp2J5tLE4f4y74kIb3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730766668; c=relaxed/simple;
	bh=h7YD5U2qEal9SqGHORAN5iv996SvPmbob1Se4iR1Cxo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HsIwSwBPhjFjz7TrlwEQb9grx2nwxDXVrIBhDUToNah7bmDAOjwu9lVx1UBS2BhtM5AylDi4fKgx+rNzcnIue6Gx11uELF29qhg6kVReOvpJHLeMe+tTBVC2WBSMoJ1LrsayvzXuZU87mqjOtzaozae6QmjyNpevlXNzhQt+tmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJXv1Y9e; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso734508466b.2;
        Mon, 04 Nov 2024 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730766665; x=1731371465; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h7YD5U2qEal9SqGHORAN5iv996SvPmbob1Se4iR1Cxo=;
        b=dJXv1Y9euGKB4hd+lcusFDxQYV246vfZfPJ7773LK/v+y9t1dgle7506lkbR2jJO/D
         R5UPdGjH1IFNlRsdAp0At9f+IlPXfKa2Dkr94R/XHyv8IcBo5be3eDwXU3j3oXAoJO0d
         9LPHOtPsQN0wsU0vVNiur/FTGGsLvxIQbnBwADWPVEJ+tL3X48EL9Ei1/M0M9YAhL9Cm
         bY8QVe5YN9HDZXdsnnOX2O8699jTTu3qBgbK3TGiDyQsAcAiQNZthzB3cm2oWEa/ZpNE
         4V7hdpJ1Z0WNkIfIKtgqahxhyHYVRHI1q4ck39SaHIANE3UdyPTlZbrfHkhzi5slP5s/
         H2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730766665; x=1731371465;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7YD5U2qEal9SqGHORAN5iv996SvPmbob1Se4iR1Cxo=;
        b=hCvSIRCYtODrxye/NxzhTex0jOFrbnVEM8kY1/m+w/7jkfvIWPx2n3evfaFmoo2K0n
         tkz9Qs/21yGDuq+O1yej/vcJCDlGnhWgdhENFcllVPvKTO7AHZJFptln2zOr+ai6JmRi
         A/nUGk+ZxPiRlOAl0STuKXoYNt5fJffnSJq5Enl7CSZr/f5pZaeP80Pm+rY46WvJKRYi
         w5RrWsshOgpIpQAHFUqRfcelwr7nnTPQBQyCrhubiCDF4SmbFsnt6mqSvTMkK9ZaCZT6
         dK7f7YDJYJNWIuVOxYTGVyFB768EObkYSUsCsT3cDXiEHNUl7pCYPnYhhm89Vz2RmHrR
         EARA==
X-Forwarded-Encrypted: i=1; AJvYcCUMD4VNqn0lyR3k9LEi/m10baM4xvKN/gIyEpQRN6cG6sGeiu9O7iENKPhtnrSRJ4rhJ261N5L8KNMsm3KA@vger.kernel.org, AJvYcCWQ30P/vI1QGpBD5axaEYl68Mi2ZylPLj7zumXib3kI+QJ2ruEXMPmF+SMsFkJvA1N9iuyNsWEZwIxt@vger.kernel.org, AJvYcCX3lZaObJTcTSTiihRCnvpue90a+1qBXmIeir2IvUcTONMRFIiQv3wOw+feDTKEk/4ZkmOPTbvzfaEmug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbcp+Hfmfy3fCsgW1BcXKvU2qHmxGYajfGBPNrXLfpSqaof9h
	dw2h4IE2Bs2rD/x4opPEs6Nymc3HOAfaO/6w7/xrroOD+lz1/jFB3y2I+rXeS8vVYuWgQlAzD6V
	fuB+wjjpXNVio0Cu835RnYRZllW1LWGZZLOk=
X-Google-Smtp-Source: AGHT+IG/Nr/DL/U4CcF7eKJtFAYO8hm9nfBMMym1cuQ5ceJB6ypdKsoaBo8hTalWHiP2xYm8+roinGtg/t0CpvmqwP4=
X-Received: by 2002:a17:906:ca45:b0:a9e:670e:38bc with SMTP id
 a640c23a62f3a-a9e670e3aedmr973388266b.3.1730766664471; Mon, 04 Nov 2024
 16:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nolan Nicholson <nolananicholson@gmail.com>
Date: Mon, 4 Nov 2024 16:30:53 -0800
Message-ID: <CAL-gK7f5=R0nrrQdPtaZZr1fd-cdAMbDMuZ_NLA8vM0SX+nGSw@mail.gmail.com>
Subject: hid-pidff.c: null-pointer deref if optional HID reports are not present
To: stable@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000039b81d06261f8414"

--00000000000039b81d06261f8414
Content-Type: multipart/alternative; boundary="00000000000039b81b06261f8412"

--00000000000039b81b06261f8412
Content-Type: text/plain; charset="UTF-8"

Hello,

(This is my first time reporting a Linux bug; please accept my apologies
for any mistakes in the process.)

When initializing a HID PID device, hid-pidff.c checks for eight required
HID reports and five optional reports. If the eight required reports are
present, the hid_pidff_init() function then attempts to find the necessary
fields in each required or optional report, using the pidff_find_fields()
function. However, if any of the five optional reports is not present,
pidff_find_fields() will trigger a null-pointer dereference.

I recently implemented the descriptors for a USB HID device with PID
force-feedback capability. After implementing the required report
descriptors but not the optional ones, I got an OOPS from the
pidff_find_fields function. I saved the OOPS from my Ubuntu installation,
and have attached it here. I later reproduced the issue on 6.11.6.

I was able to work around the issue by having my device present all of the
optional report descriptors as well as all of the required ones.

Thank you,
Nolan Nicholson

--00000000000039b81b06261f8412
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>(This is my first tim=
e reporting a Linux bug; please accept my apologies for any mistakes in the=
 process.)</div><div><br></div><div>When initializing a HID PID device, hid=
-pidff.c checks for eight required HID reports and five optional reports. I=
f the eight required reports are present, the hid_pidff_init() function the=
n attempts to find the necessary fields in each required or optional report=
, using the pidff_find_fields() function. However, if any of the five optio=
nal reports is not present, pidff_find_fields() will trigger a null-pointer=
 dereference.<br></div><div><div></div><div><br></div><div>I recently imple=
mented the=20
descriptors for a USB HID device with PID force-feedback capability. After =
implementing the required report descriptors but not the optional ones, I g=
ot an OOPS from the pidff_find_fields function. I saved the OOPS from my Ub=
untu installation, and have attached it here. I later reproduced the issue =
on 6.11.6.<br></div><div><br></div><div>I was able to work around the issue=
 by having my device present all of the optional report descriptors as well=
 as all of the required ones.<br></div></div><div><br></div><div>Thank you,=
</div><div>Nolan Nicholson<br></div></div>

--00000000000039b81b06261f8412--
--00000000000039b81d06261f8414
Content-Type: text/plain; charset="US-ASCII"; name="hid_pidff_oops.txt"
Content-Disposition: attachment; filename="hid_pidff_oops.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m33pp2jl0>
X-Attachment-Id: f_m33pp2jl0

WyAgMzgyLjY3NDk5NV0gdXNiIDEtMjogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIg
NSB1c2luZyB4aGNpX2hjZApbICAzODMuMTgxOTEzXSB1c2IgMS0yOiBOZXcgVVNCIGRldmljZSBm
b3VuZCwgaWRWZW5kb3I9Y2FmZSwgaWRQcm9kdWN0PTQwMDQsIGJjZERldmljZT0gMS4wMApbICAz
ODMuMTgxOTMxXSB1c2IgMS0yOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVj
dD0yLCBTZXJpYWxOdW1iZXI9MwpbICAzODMuMTgxOTM4XSB1c2IgMS0yOiBQcm9kdWN0OiBQaWNv
d2luZGVyClsgIDM4My4xODE5NDRdIHVzYiAxLTI6IE1hbnVmYWN0dXJlcjogTm9sYmluc29mdApb
ICAzODMuMTgxOTQ5XSB1c2IgMS0yOiBTZXJpYWxOdW1iZXI6IEU2NjE2NDA4NDMzQjU4MkIKWyAg
MzgzLjI2MDUyNV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2Jo
aWQKWyAgMzgzLjI2MDUzNV0gdXNiaGlkOiBVU0IgSElEIGNvcmUgZHJpdmVyClsgIDM4My4yODAx
MDBdIGlucHV0OiBOb2xiaW5zb2Z0IFBpY293aW5kZXIgYXMgL2RldmljZXMvcGNpMDAwMDowMC8w
MDAwOjAwOjE0LjAvdXNiMS8xLTIvMS0yOjEuMC8wMDAzOkNBRkU6NDAwNC4wMDAxL2lucHV0L2lu
cHV0MTgKWyAgMzgzLjI4MDQ5Nl0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNl
LCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwODQ4ClsgIDM4My4yODA1MDldICNQRjogc3VwZXJ2aXNv
ciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbICAzODMuMjgwNTE2XSAjUEY6IGVycm9yX2Nv
ZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKWyAgMzgzLjI4MDUyNF0gUEdEIDAgUDREIDAg
ClsgIDM4My4yODA1MzddIE9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkKWyAgMzgzLjI4
MDU0N10gQ1BVOiA0IFBJRDogNjgyNyBDb21tOiAodWRldi13b3JrZXIpIE5vdCB0YWludGVkIDYu
OC4wLTQ4LWdlbmVyaWMgIzQ4LVVidW50dQpbICAzODMuMjgwNTU4XSBIYXJkd2FyZSBuYW1lOiBM
RU5PVk8gMjBLRzAwMjJVUy8yMEtHMDAyMlVTLCBCSU9TIE4yM0VUNzFXICgxLjQ2ICkgMDIvMjAv
MjAyMApbICAzODMuMjgwNTY2XSBSSVA6IDAwMTA6cGlkZmZfZmluZF9maWVsZHMrMHgyYy8weDMy
MCBbdXNiaGlkXQpbICAzODMuMjgwNTk1XSBDb2RlOiA0NCAwMCAwMCA1NSA0OCA2MyBjMSA0OSA4
OSBmYSA0OCA4OSBlNSA0MSA1NyA0OSA4OSBmNyA0MSA1NiA0MSA1NSA0OSA4OSBkNSA0MSA1NCA1
MyA0OCA4MyBlYyAzMCA0NCA4OSA0NSBiNCA0OCA4OSA0NSBjOCAzMSBjMCA8NDE+IDhiIDk1IDQ4
IDA4IDAwIDAwIDg5IDQ1IGQwIDQ1IDMxIGY2IDQ4IDg5IGMzIDRkIDg5IGQ0IDg1IGQyIDc1Clsg
IDM4My4yODA2MDJdIFJTUDogMDAxODpmZmZmOWIyZjAwOGRmNzA4IEVGTEFHUzogMDAwMTAyNDYK
WyAgMzgzLjI4MDYxMV0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjhlMzE4ODlmNDgw
MCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDUKWyAgMzgzLjI4MDYxNl0gUkRYOiAwMDAwMDAwMDAwMDAw
MDAwIFJTSTogZmZmZmZmZmZjMWQ2MDVhOCBSREk6IGZmZmY4ZTMxODg5ZjQ4ZTAKWyAgMzgzLjI4
MDYyMV0gUkJQOiBmZmZmOWIyZjAwOGRmNzYwIFIwODogMDAwMDAwMDAwMDAwMDAwMSBSMDk6IDAw
MDAwMDAwMDAwMDAwMDAKWyAgMzgzLjI4MDYyNl0gUjEwOiBmZmZmOGUzMTg4OWY0OGUwIFIxMTog
MDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmY4ZTMyNDBlMWEwMDAKWyAgMzgzLjI4MDYzMV0gUjEz
OiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZjhlMzI0MGUxYTAwMCBSMTU6IGZmZmZmZmZmYzFk
NjA1YTgKWyAgMzgzLjI4MDYzNl0gRlM6ICAwMDAwN2ZlMDcwNjZkOGMwKDAwMDApIEdTOmZmZmY4
ZTM1MTI2MDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICAzODMuMjgwNjQyXSBD
UzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgIDM4My4y
ODA2NDhdIENSMjogMDAwMDAwMDAwMDAwMDg0OCBDUjM6IDAwMDAwMDAyNzNjZGEwMDMgQ1I0OiAw
MDAwMDAwMDAwMzcwNmYwClsgIDM4My4yODA2NTRdIENhbGwgVHJhY2U6ClsgIDM4My4yODA2NTld
ICA8VEFTSz4KWyAgMzgzLjI4MDY2Nl0gID8gc2hvd19yZWdzKzB4NmQvMHg4MApbICAzODMuMjgw
Njc4XSAgPyBfX2RpZSsweDI0LzB4ODAKWyAgMzgzLjI4MDY4Nl0gID8gcGFnZV9mYXVsdF9vb3Bz
KzB4OTkvMHgxYjAKWyAgMzgzLjI4MDY5OF0gID8gZG9fdXNlcl9hZGRyX2ZhdWx0KzB4MmUyLzB4
NjcwClsgIDM4My4yODA3MDhdICA/IGV4Y19wYWdlX2ZhdWx0KzB4ODMvMHgxYjAKWyAgMzgzLjI4
MDcyMF0gID8gYXNtX2V4Y19wYWdlX2ZhdWx0KzB4MjcvMHgzMApbICAzODMuMjgwNzM0XSAgPyBw
aWRmZl9maW5kX2ZpZWxkcysweDJjLzB4MzIwIFt1c2JoaWRdClsgIDM4My4yODA3NTNdICA/IGRl
dmljZV9jcmVhdGUrMHg1MS8weDgwClsgIDM4My4yODA3NjVdICBwaWRmZl9pbml0X2ZpZWxkcysw
eGUwLzB4NDYwIFt1c2JoaWRdClsgIDM4My4yODA3ODNdICBoaWRfcGlkZmZfaW5pdCsweDExNy8w
eDRkMCBbdXNiaGlkXQpbICAzODMuMjgwODA0XSAgaGlkX2Nvbm5lY3QrMHgxODEvMHg0NDAgW2hp
ZF0KWyAgMzgzLjI4MDg1MF0gIGhpZF9od19zdGFydCsweDRjLzB4NzAgW2hpZF0KWyAgMzgzLjI4
MDg4Nl0gIGhpZF9nZW5lcmljX3Byb2JlKzB4MmQvMHg0MCBbaGlkX2dlbmVyaWNdClsgIDM4My4y
ODA5MDVdICBoaWRfZGV2aWNlX3Byb2JlKzB4MTJkLzB4MWIwIFtoaWRdClsgIDM4My4yODA5MzVd
ICByZWFsbHlfcHJvYmUrMHgxYzQvMHg0MTAKWyAgMzgzLjI4MDk0Nl0gIF9fZHJpdmVyX3Byb2Jl
X2RldmljZSsweDhjLzB4MTgwClsgIDM4My4yODA5NTddICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4
MjQvMHhkMApbICAzODMuMjgwOTY4XSAgX19kcml2ZXJfYXR0YWNoKzB4MTBiLzB4MjEwClsgIDM4
My4yODA5NzddICA/IF9fcGZ4X19fZHJpdmVyX2F0dGFjaCsweDEwLzB4MTAKWyAgMzgzLjI4MDk4
N10gIGJ1c19mb3JfZWFjaF9kZXYrMHg4YS8weGYwClsgIDM4My4yODEwMDBdICBkcml2ZXJfYXR0
YWNoKzB4MWUvMHgzMApbICAzODMuMjgxMDEyXSAgYnVzX2FkZF9kcml2ZXIrMHgxNGUvMHgyOTAK
WyAgMzgzLjI4MTAyNl0gIGRyaXZlcl9yZWdpc3RlcisweDVlLzB4MTMwClsgIDM4My4yODEwMzZd
ICA/IF9fcGZ4X2hpZF9nZW5lcmljX2luaXQrMHgxMC8weDEwIFtoaWRfZ2VuZXJpY10KWyAgMzgz
LjI4MTA1NF0gIF9faGlkX3JlZ2lzdGVyX2RyaXZlcisweDRmLzB4YTAgW2hpZF0KWyAgMzgzLjI4
MTA4OF0gID8gX19wZnhfaGlkX2dlbmVyaWNfaW5pdCsweDEwLzB4MTAgW2hpZF9nZW5lcmljXQpb
ICAzODMuMjgxMTA2XSAgaGlkX2dlbmVyaWNfaW5pdCsweDIzLzB4ZmYwIFtoaWRfZ2VuZXJpY10K
WyAgMzgzLjI4MTEyM10gIGRvX29uZV9pbml0Y2FsbCsweDViLzB4MzQwClsgIDM4My4yODExMzld
ICBkb19pbml0X21vZHVsZSsweDk3LzB4MjkwClsgIDM4My4yODExNDhdICBsb2FkX21vZHVsZSsw
eGJhMS8weGNmMApbICAzODMuMjgxMTYyXSAgaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4OTYvMHgx
MDAKWyAgMzgzLjI4MTE2OV0gID8gaW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4OTYvMHgxMDAKWyAg
MzgzLjI4MTE4Ml0gIGlkZW1wb3RlbnRfaW5pdF9tb2R1bGUrMHgxMWMvMHgyYjAKWyAgMzgzLjI4
MTE5NF0gIF9feDY0X3N5c19maW5pdF9tb2R1bGUrMHg2NC8weGQwClsgIDM4My4yODEyMDJdICB4
NjRfc3lzX2NhbGwrMHgxZDZlLzB4MjVjMApbICAzODMuMjgxMjA5XSAgZG9fc3lzY2FsbF82NCsw
eDdmLzB4MTgwClsgIDM4My4yODEyMjBdICA/IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHg4
Ni8weDI2MApbICAzODMuMjgxMjMxXSAgPyBkb19zeXNjYWxsXzY0KzB4OGMvMHgxODAKWyAgMzgz
LjI4MTI0MF0gID8gZG9fc3lzY2FsbF82NCsweDhjLzB4MTgwClsgIDM4My4yODEyNDhdICA/IF9f
ZnB1dCsweDE1ZS8weDJlMApbICAzODMuMjgxMjU3XSAgPyBfX3NlY2NvbXBfZmlsdGVyKzB4MzY4
LzB4NTcwClsgIDM4My4yODEyNzBdICA/IGV4dDRfbGxzZWVrKzB4YzMvMHgxMzAKWyAgMzgzLjI4
MTI3OV0gID8ga3N5c19sc2VlaysweDdkLzB4ZDAKWyAgMzgzLjI4MTI5MF0gID8gc3lzY2FsbF9l
eGl0X3RvX3VzZXJfbW9kZSsweDg2LzB4MjYwClsgIDM4My4yODEzMDBdICA/IGRvX3N5c2NhbGxf
NjQrMHg4Yy8weDE4MApbICAzODMuMjgxMzA5XSAgPyBpcnFlbnRyeV9leGl0KzB4NDMvMHg1MApb
ICAzODMuMjgxMzE1XSAgPyBleGNfcGFnZV9mYXVsdCsweDk0LzB4MWIwClsgIDM4My4yODEzMjVd
ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3OC8weDgwClsgIDM4My4yODEzMzJd
IFJJUDogMDAzMzoweDdmZTA3MDUyNzI1ZApbICAzODMuMjgxMzY4XSBDb2RlOiBmZiBjMyA2NiAy
ZSAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA5MCBmMyAwZiAxZSBmYSA0OCA4OSBmOCA0OCA4OSBm
NyA0OCA4OSBkNiA0OCA4OSBjYSA0ZCA4OSBjMiA0ZCA4OSBjOCA0YyA4YiA0YyAyNCAwOCAwZiAw
NSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhiIDBkIDhiIGJiIDBkIDAwIGY3IGQ4
IDY0IDg5IDAxIDQ4ClsgIDM4My4yODEzNzVdIFJTUDogMDAyYjowMDAwN2ZmZWE4MGRjNjc4IEVG
TEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAxMzkKWyAgMzgzLjI4MTM4NV0g
UkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU2YWU0ZDU4MjNiMCBSQ1g6IDAwMDA3ZmUw
NzA1MjcyNWQKWyAgMzgzLjI4MTM5M10gUkRYOiAwMDAwMDAwMDAwMDAwMDA0IFJTSTogMDAwMDdm
ZTA3MDg0YTA3ZCBSREk6IDAwMDAwMDAwMDAwMDAwMTMKWyAgMzgzLjI4MTQwMV0gUkJQOiAwMDAw
N2ZmZWE4MGRjNzMwIFIwODogMDAwMDAwMDAwMDAwMDA0MCBSMDk6IDAwMDA3ZmZlYTgwZGM2YzAK
WyAgMzgzLjI4MTQwNl0gUjEwOiAwMDAwN2ZlMDcwNjAzYjIwIFIxMTogMDAwMDAwMDAwMDAwMDI0
NiBSMTI6IDAwMDA3ZmUwNzA4NGEwN2QKWyAgMzgzLjI4MTQxMV0gUjEzOiAwMDAwMDAwMDAwMDIw
MDAwIFIxNDogMDAwMDU2YWU0ZDc3YWIwMCBSMTU6IDAwMDA1NmFlNGQ2OTY1ZTAKWyAgMzgzLjI4
MTQyMl0gIDwvVEFTSz4KWyAgMzgzLjI4MTQyNl0gTW9kdWxlcyBsaW5rZWQgaW46IGhpZF9nZW5l
cmljKCspIHVzYmhpZCBjY20gcmZjb21tIHNuZF9zZXFfZHVtbXkgc25kX2hydGltZXIgc25kX3Nl
cV9taWRpIHNuZF9zZXFfbWlkaV9ldmVudCBzbmRfcmF3bWlkaSBzbmRfc2VxIHNuZF9zZXFfZGV2
aWNlIHNuZF9oZGFfY29kZWNfaGRtaSBxcnRyIGNtYWMgYWxnaWZfaGFzaCBhbGdpZl9za2NpcGhl
ciBhZl9hbGcgYm5lcCBzbmRfY3RsX2xlZCBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgcm1pX3NtYnVz
IHNuZF9oZGFfY29kZWNfZ2VuZXJpYyBybWlfY29yZSBpbnRlbF91bmNvcmVfZnJlcXVlbmN5IGlu
dGVsX3VuY29yZV9mcmVxdWVuY3lfY29tbW9uIHNuZF9zb2ZfcGNpX2ludGVsX3NrbCBzbmRfc29m
X2ludGVsX2hkYV9jb21tb24gc291bmR3aXJlX2ludGVsIHNuZF9zb2ZfaW50ZWxfaGRhX21saW5r
IGludGVsX3RjY19jb29saW5nIHNvdW5kd2lyZV9jYWRlbmNlIHNuZF9zb2ZfaW50ZWxfaGRhIHg4
Nl9wa2dfdGVtcF90aGVybWFsIGludGVsX3Bvd2VyY2xhbXAgc25kX3NvZl9wY2kgY29yZXRlbXAg
YmluZm10X21pc2Mgc25kX3NvZl94dGVuc2FfZHNwIHNuZF9zb2Ygc25kX3NvZl91dGlscyBrdm1f
aW50ZWwgc291bmR3aXJlX2dlbmVyaWNfYWxsb2NhdGlvbiBzb3VuZHdpcmVfYnVzIHNuZF9zb2Nf
YXZzIHNuZF9zb2NfaGRhX2NvZGVjIGt2bSBubHNfaXNvODg1OV8xIHNuZF9zb2Nfc2tsIHNuZF9z
b2NfaGRhY19oZGEgc25kX2hkYV9leHRfY29yZSBzbmRfc29jX3NzdF9pcGMgaXJxYnlwYXNzIHNu
ZF9zb2Nfc3N0X2RzcCBjcmN0MTBkaWZfcGNsbXVsIHNuZF9zb2NfYWNwaV9pbnRlbF9tYXRjaCBw
b2x5dmFsX2NsbXVsbmkgc25kX3NvY19hY3BpIHBvbHl2YWxfZ2VuZXJpYyBnaGFzaF9jbG11bG5p
X2ludGVsIHNoYTI1Nl9zc3NlMyBzbmRfc29jX2NvcmUgaXdsbXZtIHNoYTFfc3NzZTMgc25kX2Nv
bXByZXNzIGFlc25pX2ludGVsIG1laV9oZGNwIGludGVsX3JhcGxfbXNyIG1laV9weHAgaTkxNSBh
Yzk3X2J1cyBjcnlwdG9fc2ltZApbICAzODMuMjgxNTc1XSAgbWFjODAyMTEgc25kX3BjbV9kbWFl
bmdpbmUgY3J5cHRkIHV2Y3ZpZGVvIGJ0dXNiIHZpZGVvYnVmMl92bWFsbG9jIHJhcGwgYnRydGwg
dXZjIGJ0aW50ZWwgdmlkZW9idWYyX21lbW9wcyBidGJjbSB2aWRlb2J1ZjJfdjRsMiBwcm9jZXNz
b3JfdGhlcm1hbF9kZXZpY2VfcGNpX2xlZ2FjeSBzbmRfaGRhX2ludGVsIGJ0bXRrIHVhcyBsaWJh
cmM0IGludGVsX2NzdGF0ZSBwcm9jZXNzb3JfdGhlcm1hbF9kZXZpY2UgdmlkZW9kZXYgc25kX2lu
dGVsX2RzcGNmZyBibHVldG9vdGggcHJvY2Vzc29yX3RoZXJtYWxfd3RfaGludCBpd2x3aWZpIHNu
ZF9pbnRlbF9zZHdfYWNwaSBwcm9jZXNzb3JfdGhlcm1hbF9yZmltIHZpZGVvYnVmMl9jb21tb24g
cHJvY2Vzc29yX3RoZXJtYWxfcmFwbCBzbmRfaGRhX2NvZGVjIGludGVsX3JhcGxfY29tbW9uIGRy
bV9idWRkeSBtYyB1c2Jfc3RvcmFnZSBwcm9jZXNzb3JfdGhlcm1hbF93dF9yZXEgdHRtIHNuZF9o
ZGFfY29yZSB0aGlua19sbWkgZWNkaF9nZW5lcmljIHdtaV9ibW9mIGludGVsX3dtaV90aHVuZGVy
Ym9sdCBlY2MgZmlybXdhcmVfYXR0cmlidXRlc19jbGFzcyBkcm1fZGlzcGxheV9oZWxwZXIgc25k
X2h3ZGVwIGkyY19pODAxIHByb2Nlc3Nvcl90aGVybWFsX3Bvd2VyX2Zsb29yIGNmZzgwMjExIGky
Y19zbWJ1cyBjZWMgc25kX3BjbSBwcm9jZXNzb3JfdGhlcm1hbF9tYm94IG1laV9tZSByY19jb3Jl
IGludGVsX3NvY19kdHNfaW9zZiBpMmNfYWxnb19iaXQgc25kX3RpbWVyIGludGVsX3hoY2lfdXNi
X3JvbGVfc3dpdGNoIG1laSBpbnRlbF9wY2hfdGhlcm1hbCBpbnRlbF9wbWNfY29yZSBpbnQzNDAz
X3RoZXJtYWwgdGhpbmtwYWRfYWNwaSBpbnQzNDB4X3RoZXJtYWxfem9uZSBudnJhbSBpbnRlbF92
c2VjIGludDM0MDBfdGhlcm1hbCBwbXRfdGVsZW1ldHJ5IGlucHV0X2xlZHMgam95ZGV2IGFjcGlf
cGFkIHBtdF9jbGFzcyBhY3BpX3RoZXJtYWxfcmVsIHNlcmlvX3JhdyBtYWNfaGlkIHNjaF9mcV9j
b2RlbCBtc3IgcGFycG9ydF9wYyBwcGRldiBscApbICAzODMuMjgxNzM4XSAgcGFycG9ydCBlZmlf
cHN0b3JlIG5mbmV0bGluayBkbWlfc3lzZnMgaXBfdGFibGVzIHhfdGFibGVzIGF1dG9mczQgc25k
IG52bWUgc291bmRjb3JlIHVjc2lfYWNwaSBjcmMzMl9wY2xtdWwgbnZtZV9jb3JlIHR5cGVjX3Vj
c2kgdmlkZW8gcHNtb3VzZSB0aHVuZGVyYm9sdCB4aGNpX3BjaSBlMTAwMGUgdHlwZWMgbnZtZV9h
dXRoIHhoY2lfcGNpX3JlbmVzYXMgaTJjX2hpZF9hY3BpIGkyY19oaWQgbGVkdHJpZ19hdWRpbyBw
bGF0Zm9ybV9wcm9maWxlIGhpZCB3bWkKWyAgMzgzLjI4MTgwMV0gQ1IyOiAwMDAwMDAwMDAwMDAw
ODQ4ClsgIDM4My4yODE4MDddIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQpb
ICAzODMuNjI5Mzg1XSBSSVA6IDAwMTA6cGlkZmZfZmluZF9maWVsZHMrMHgyYy8weDMyMCBbdXNi
aGlkXQpbICAzODMuNjI5NDIwXSBDb2RlOiA0NCAwMCAwMCA1NSA0OCA2MyBjMSA0OSA4OSBmYSA0
OCA4OSBlNSA0MSA1NyA0OSA4OSBmNyA0MSA1NiA0MSA1NSA0OSA4OSBkNSA0MSA1NCA1MyA0OCA4
MyBlYyAzMCA0NCA4OSA0NSBiNCA0OCA4OSA0NSBjOCAzMSBjMCA8NDE+IDhiIDk1IDQ4IDA4IDAw
IDAwIDg5IDQ1IGQwIDQ1IDMxIGY2IDQ4IDg5IGMzIDRkIDg5IGQ0IDg1IGQyIDc1ClsgIDM4My42
Mjk0MjVdIFJTUDogMDAxODpmZmZmOWIyZjAwOGRmNzA4IEVGTEFHUzogMDAwMTAyNDYKWyAgMzgz
LjYyOTQzMF0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjhlMzE4ODlmNDgwMCBSQ1g6
IDAwMDAwMDAwMDAwMDAwMDUKWyAgMzgzLjYyOTQzNF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJT
STogZmZmZmZmZmZjMWQ2MDVhOCBSREk6IGZmZmY4ZTMxODg5ZjQ4ZTAKWyAgMzgzLjYyOTQzN10g
UkJQOiBmZmZmOWIyZjAwOGRmNzYwIFIwODogMDAwMDAwMDAwMDAwMDAwMSBSMDk6IDAwMDAwMDAw
MDAwMDAwMDAKWyAgMzgzLjYyOTQ0MF0gUjEwOiBmZmZmOGUzMTg4OWY0OGUwIFIxMTogMDAwMDAw
MDAwMDAwMDAwMCBSMTI6IGZmZmY4ZTMyNDBlMWEwMDAKWyAgMzgzLjYyOTQ0M10gUjEzOiAwMDAw
MDAwMDAwMDAwMDAwIFIxNDogZmZmZjhlMzI0MGUxYTAwMCBSMTU6IGZmZmZmZmZmYzFkNjA1YTgK
WyAgMzgzLjYyOTQ0Nl0gRlM6ICAwMDAwN2ZlMDcwNjZkOGMwKDAwMDApIEdTOmZmZmY4ZTM1MTI2
MDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbICAzODMuNjI5NDUwXSBDUzogIDAw
MTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsgIDM4My42Mjk0NTNd
IENSMjogMDAwMDAwMDAwMDAwMDg0OCBDUjM6IDAwMDAwMDAyNzNjZGEwMDMgQ1I0OiAwMDAwMDAw
MDAwMzcwNmYwClsgIDM4My42Mjk0NTddIG5vdGU6ICh1ZGV2LXdvcmtlcilbNjgyN10gZXhpdGVk
IHdpdGggaXJxcyBkaXNhYmxlZApbICA0MDcuNjE1MTc3XSB1c2IgMS0yOiBVU0IgZGlzY29ubmVj
dCwgZGV2aWNlIG51bWJlciA1Cg==
--00000000000039b81d06261f8414--

