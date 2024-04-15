Return-Path: <linux-usb+bounces-9328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E88A47A6
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 07:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238EA281DAB
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 05:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6BC5258;
	Mon, 15 Apr 2024 05:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hyUPfpzj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D74C8D
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713159732; cv=none; b=Ef2DcCt6R2Ig+QPU0Lk6+J1r+xPweeMfeE5UgF5DE2GDupwxiOnw9al67Fz6GlpJeuvPsmcrcKNSQa1oB7zZwO4AQn1DifMqAzbDAoOqsPMtQLp6d3VgL/wnQQGEtcBB8vtsZMMrtIey1F3rjueJL7SLgTWXClt5I7IachJp0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713159732; c=relaxed/simple;
	bh=0lD2B+RW299seWbRP9XyzSZIzFLATENgQB08j+JGUw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=rVoPKGcUT1uAeFYuF/epuUHH6DkRe8+Q1tSUk8mwuOMoJdBXtn36Y+C0phyjTSqmDmLH8CGgV3A8g35Ee81Wq8dA32U3ngB4naaTK9+PXlxpIWLLQ2tD36JQAb8jQkq9kJkFUXcmIGlM0Kc9jk8ZB/CpAJyIUdyAk9dR8Zv8LYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hyUPfpzj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4186cdae96fso1132375e9.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Apr 2024 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713159728; x=1713764528; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:cc:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0lD2B+RW299seWbRP9XyzSZIzFLATENgQB08j+JGUw8=;
        b=hyUPfpzjCcyHMqdxvHV7e7u9MN3MHqGa39VMOIx/1/zNKa2gacVY3g241R+X1ARuTN
         gumBTLEYIM0FqzEMkrPGr/e+CqTloMxD5SWVou5uzy1B2MM2yrN+qRXi2incvCBWTaaE
         RQWWOGGrynKxrZxiOhi3VWvlTBCbvastgfROw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713159728; x=1713764528;
        h=in-reply-to:autocrypt:from:cc:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lD2B+RW299seWbRP9XyzSZIzFLATENgQB08j+JGUw8=;
        b=bKdW4iFGzEHGkEX3gGJQgbBbOerMHLLCMulbVUAQOVPOZXc+fxGmObaeqEGRngn2M3
         yH3d35BP0MgfhyMaTmuXFUqpZj3jVbUQkPRxl0qu+VVitl9uK6fPNCPXooT2oSp+WO0j
         Rkx9VFdv+mvzp58rOET/4ln1WuQe9KR0FNbQV6VvRv9+6mgO3hDItoECZSy/oA6mRROq
         rqWX7HYFbIzSnI4HMcGb+FXCCPibJK1obG+iilSBVVjYUvEZgxVx860tnILByEpZAx0A
         jHZCzXTCN8MPpk47fvlhkoCDeVEHS63NH9PGgmY6R8W1rg8P0jnEPVrnDHw9EZoTgCrm
         ZmAw==
X-Gm-Message-State: AOJu0YwpiBwdEEa3H1jHv97MhWPDyhzsXuNfToD5Loc4YxNHrbFkiRBc
	EA+iU3AyEAbX/24+0ufYBRYn5iYOZ1vtO85wSXUAVdxzNc7+PVW8yTMjKWQlZQ==
X-Google-Smtp-Source: AGHT+IHSlbD2A/lEYlPMI0BfveoUC1xT8L5TrxfK7lMJ1DXEzTDaEQvC/N8oTOhuWvEpUPIodLEw+w==
X-Received: by 2002:a05:600c:4f0d:b0:416:6dff:9850 with SMTP id l13-20020a05600c4f0d00b004166dff9850mr8029442wmq.0.1713159727999;
        Sun, 14 Apr 2024 22:42:07 -0700 (PDT)
Received: from [192.168.2.113] (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c139100b0041496734318sm17984908wmf.24.2024.04.14.22.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 22:42:07 -0700 (PDT)
Message-ID: <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
Date: Mon, 15 Apr 2024 05:42:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: close race between read and workqueue
To: oneukum@suse.com, bjorn@mork.no
References: <20240314115132.3907-1-oneukum () suse ! com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, ejcaruso@chromium.org
From: Aleksander Morgado <aleksandermj@chromium.org>
Autocrypt: addr=aleksandermj@chromium.org; keydata=
 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
In-Reply-To: <20240314115132.3907-1-oneukum () suse ! com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------abHSOwEfOBjnuC3tZQm7RPx7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------abHSOwEfOBjnuC3tZQm7RPx7
Content-Type: multipart/mixed; boundary="------------BGoFk61pypwDw2TBE0Zi64vT";
 protected-headers="v1"
From: Aleksander Morgado <aleksandermj@chromium.org>
To: oneukum@suse.com, bjorn@mork.no
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, ejcaruso@chromium.org
Message-ID: <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
Subject: Re: [PATCH] usb: cdc-wdm: close race between read and workqueue
References: <20240314115132.3907-1-oneukum () suse ! com>
In-Reply-To: <20240314115132.3907-1-oneukum () suse ! com>

--------------BGoFk61pypwDw2TBE0Zi64vT
Content-Type: multipart/mixed; boundary="------------plWNZDNC0kd0sX0NgosYGxl2"

--------------plWNZDNC0kd0sX0NgosYGxl2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGV5IE9saXZlciAmIEJqw7hybiwNCg0KT24gMy8xNC8yNCAxMTo1MCwgT2xpdmVyIE5ldWt1
bSB3cm90ZToNCj4gd2RtX3JlYWQoKSBjYW5ub3QgcmFjZSB3aXRoIGl0c2VsZi4gSG93ZXZl
ciwgaW4NCj4gc2VydmljZV9vdXRzdGFuZGluZ19pbnRlcnJ1cHQoKSBpdCBjYW4gcmFjZSB3
aXRoIHRoZQ0KPiB3b3JrcXVldWUsIHdoaWNoIGNhbiBiZSB0cmlnZ2VyZWQgYnkgZXJyb3Ig
aGFuZGxpbmcuDQo+IA0KPiBIZW5jZSB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBX
RE1fUkVTUE9ORElORw0KPiBmbGFnIGlzIG5vdCBqdXN0IG9ubHkgc2V0IGJ1dCB0ZXN0ZWQu
DQo+IA0KPiBGaXhlczogYWZiYTkzN2U1NDBjOSAoIlVTQjogQ0RDIFdETSBkcml2ZXIiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KDQpX
ZSBhcmUgbm90IGF3YXJlIG9mIGFsbCB0aGUgZGV0YWlscyBpbnZvbHZlZCBpbiB0aGlzIHBh
dGNoLCBidXQgd2UgaGFkIA0KdG8gcmV2ZXJ0IGl0IGluIGFsbCB0aGUgZGlmZmVyZW50IENo
cm9tZU9TIGtlcm5lbCB2ZXJzaW9ucyB3aGVyZSB3ZSBoYWQgDQppdCBjaGVycnktcGlja2Vk
LCBiZWNhdXNlIGl0IGJyb2tlIHRoZSBNQklNIGNvbW11bmljYXRpb24gd2l0aCB0aGUgSW50
ZWwgDQpYTU0gYmFzZWQgRmlib2NvbW0gTDg1MCBtb2RlbS4gT3RoZXIgbW9kZW1zIHNoaXBw
ZWQgaW4gQ2hyb21lYm9va3MgbGlrZSANCnRoZSBRQyBiYXNlZCBGaWJvY29tbSBGTTEwMSBk
b24ndCBzZWVtIHRvIGJlIGFmZmVjdGVkLg0KDQpBdHRhY2hlZCBpcyBhbiBleGFtcGxlIG91
dHB1dCBvZiBtYmltY2xpIHRhbGtpbmcgZGlyZWN0bHkgdG8gdGhlIGNkYy13ZG0gDQpwb3J0
IChpLmUuIHdpdGhvdXQgTW9kZW1NYW5hZ2VyIG9yIHRoZSBtYmltLXByb3h5KS4gSW4gdGhl
IGV4YW1wbGUsIHdlIA0KYXJlIHJlY2VpdmluZyBhIGJ1bmNoIG9mIGRpZmZlcmVudCBtZXNz
YWdlcyBmcm9tIHByZXZpb3VzIG1iaW1jbGkgcnVucy4gDQpMb29raW5nIGF0IHRoZSB0aW1l
c3RhbXBzLCBpdCBsb29rcyBhcyBpZiB3ZSBvbmx5IHJlY2VpdmUgYSBtZXNzYWdlIA0Kcmln
aHQgYWZ0ZXIgd2UgaGF2ZSBzZW50IG9uZSwgZS5nLiBhZnRlciBlYWNoICJvcGVuIHJlcXVl
c3QiIHdlIGVuZCB1cCANCnJlY2VpdmluZyByZXNwb25zZXMgZm9yIHJlcXVlc3RzIHNlbnQg
aW4gZWFybGllciBydW5zOyBvciBzb21ldGhpbmcgDQphbG9uZyB0aG9zZSBsaW5lcy4NCg0K
SXMgdGhpcyBiYWQgYmVoYXZpb3Igb2YgdGhpcyBzcGVjaWZpYyBtb2RlbSBjaGlwc2V0LCBh
bmQgaWYgc28sIGhvdyBjYW4gDQp3ZSB3b3JrYXJvdW5kIGl0PyBJZiB5b3UgbmVlZCBhbnkg
YWRkaXRpb25hbCBpbmZvcm1hdGlvbiBvciBoZWxwIHRvIHRlc3QgDQpuZXcgcGF0Y2hlcywg
bGV0IHVzIGtub3cuDQoNCkNoZWVycyENCg0KLS0gDQpBbGVrc2FuZGVyDQo=
--------------plWNZDNC0kd0sX0NgosYGxl2
Content-Type: text/plain; charset=UTF-8; name="cdc-wdm-errors.txt"
Content-Disposition: attachment; filename="cdc-wdm-errors.txt"
Content-Transfer-Encoding: base64

bWV0YWtuaWdodC1yZXY0IH4gIyBtYmltY2xpIC1kIC9kZXYvY2RjLXdkbTAgLS1xdWVyeS1k
ZXZpY2Utc2VydmljZXMgLS12ZXJib3NlLWZ1bGwKWzExIEFwciAyMDI0LCAwMToxMzoyNV0g
W0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gb3BlbmluZyBkZXZpY2UuLi4KWzExIEFwciAyMDI0
LCAwMToxMzoyNV0gW0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gcXVlcmllZCBtYXggY29udHJv
bCBtZXNzYWdlIHNpemU6IDUxMgpbMTEgQXByIDIwMjQsIDAxOjEzOjI1XSBbRGVidWddIFsv
ZGV2L2NkYy13ZG0wXSBzZW50IG1lc3NhZ2UuLi4KPDw8PDw8IFJBVzoKPDw8PDw8ICAgbGVu
Z3RoID0gMTYKPDw8PDw8ICAgZGF0YSAgID0gMDE6MDA6MDA6MDA6MTA6MDA6MDA6MDA6MDE6
MDA6MDA6MDA6MDA6MDI6MDA6MDAKCgpbMTEgQXByIDIwMjQsIDAxOjEzOjI1XSBbRGVidWdd
IFsvZGV2L2NkYy13ZG0wXSBzZW50IG1lc3NhZ2UgKHRyYW5zbGF0ZWQpLi4uCjw8PDw8PCBI
ZWFkZXI6Cjw8PDw8PCAgIGxlbmd0aCAgICAgID0gMTYKPDw8PDw8ICAgdHlwZSAgICAgICAg
PSBvcGVuICgweDAwMDAwMDAxKQo8PDw8PDwgICB0cmFuc2FjdGlvbiA9IDEKPDw8PDw8IENv
bnRlbnRzOgo8PDw8PDwgICBtYXggY29udHJvbCB0cmFuc2ZlciA9IDUxMgoKClsxMSBBcHIg
MjAyNCwgMDE6MTM6MjVdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHJlY2VpdmVkIG1lc3Nh
Z2UuLi4gKHBhcnRpYWwgZnJhZ21lbnQpCj4+Pj4+PiBSQVc6Cj4+Pj4+PiAgIGxlbmd0aCA9
IDE2OAo+Pj4+Pj4gICBkYXRhICAgPSAwMzowMDowMDo4MDpBODowMDowMDowMDowNTowMDow
MDowMDowMzowMDowMDowMDowMjowMDowMDowMDowMDowMDowMDowMDowMDowMDowMDowMDow
MTowMDowMDowMDowMTowMDowMDowMDozRDowMTpEQzpDNTpGRTpGNTo0RDowNTowRDozQTpC
RTpGNzowNTo4RTo5QTpBRjowMDowMDowMDowMDowMDowMDowMDowMDowNDowMDowMDowMDow
MzowMDowMDowMDowNDowMDowMDowMDowNjowMDowMDowMDowOTowMDowMDowMDpDMjpGNjo1
ODo4RTpGMDozNzo0QjpDOTo4Njo2NTpGNDpENDo0QjpEMDo5Mzo2NzowMDowMDowMDowMDow
MDowMDowMDowMDowNjowMDowMDowMDowMTowMDowMDowMDowMjowMDowMDowMDowMzowMDow
MDowMDowNDowMDowMDowMDowNTowMDowMDowMDowNjowMDowMDowMDo2ODoyMjozRDowNDo5
Rjo2Qzo0RTowRjo4MjoyRDoyODo0NDoxRjpCNzoyMzo0MDowMDowMDowMDowMDowMDowMDow
MDowMDowMjowMDowMDowMDowMTowMDowMDowMDowMjowMDowMDowMAoKClsxMSBBcHIgMjAy
NCwgMDE6MTM6MjVdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHJlY2VpdmVkIG1lc3NhZ2Ug
ZnJhZ21lbnQgKHRyYW5zbGF0ZWQpLi4uCj4+Pj4+PiBIZWFkZXI6Cj4+Pj4+PiAgIGxlbmd0
aCAgICAgID0gMTY4Cj4+Pj4+PiAgIHR5cGUgICAgICAgID0gY29tbWFuZC1kb25lICgweDgw
MDAwMDAzKQo+Pj4+Pj4gICB0cmFuc2FjdGlvbiA9IDUKPj4+Pj4+IEZyYWdtZW50IGhlYWRl
cjoKPj4+Pj4+ICAgdG90YWwgICA9IDMKPj4+Pj4+ICAgY3VycmVudCA9IDIKCgpbMTEgQXBy
IDIwMjQsIDAxOjEzOjI1XSBbRGVidWddIFsvZGV2L2NkYy13ZG0wXSBubyB0cmFuc2FjdGlv
biBtYXRjaGVkIGluIHJlY2VpdmVkIG1lc3NhZ2UKWzExIEFwciAyMDI0LCAwMToxMzoyNV0g
W0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gcmVjZWl2ZWQgdW5leHBlY3RlZCBtZXNzYWdlICh0
cmFuc2xhdGVkKS4uLgo+Pj4+Pj4gSGVhZGVyOgo+Pj4+Pj4gICBsZW5ndGggICAgICA9IDE2
OAo+Pj4+Pj4gICB0eXBlICAgICAgICA9IGNvbW1hbmQtZG9uZSAoMHg4MDAwMDAwMykKPj4+
Pj4+ICAgdHJhbnNhY3Rpb24gPSA1Cj4+Pj4+PiBGcmFnbWVudCBoZWFkZXI6Cj4+Pj4+PiAg
IHRvdGFsICAgPSAzCj4+Pj4+PiAgIGN1cnJlbnQgPSAyCgoKWzExIEFwciAyMDI0LCAwMTox
MzozMF0gW0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gbnVtYmVyIG9mIGNvbnNlY3V0aXZlIHRp
bWVvdXRzOiAxClsxMSBBcHIgMjAyNCwgMDE6MTM6MzBdIFtEZWJ1Z10gWy9kZXYvY2RjLXdk
bTBdIHNlbnQgbWVzc2FnZS4uLgo8PDw8PDwgUkFXOgo8PDw8PDwgICBsZW5ndGggPSAxNgo8
PDw8PDwgICBkYXRhICAgPSAwMTowMDowMDowMDoxMDowMDowMDowMDowMjowMDowMDowMDow
MDowMjowMDowMAoKClsxMSBBcHIgMjAyNCwgMDE6MTM6MzBdIFtEZWJ1Z10gWy9kZXYvY2Rj
LXdkbTBdIHNlbnQgbWVzc2FnZSAodHJhbnNsYXRlZCkuLi4KPDw8PDw8IEhlYWRlcjoKPDw8
PDw8ICAgbGVuZ3RoICAgICAgPSAxNgo8PDw8PDwgICB0eXBlICAgICAgICA9IG9wZW4gKDB4
MDAwMDAwMDEpCjw8PDw8PCAgIHRyYW5zYWN0aW9uID0gMgo8PDw8PDwgQ29udGVudHM6Cjw8
PDw8PCAgIG1heCBjb250cm9sIHRyYW5zZmVyID0gNTEyCgoKWzExIEFwciAyMDI0LCAwMTox
MzozMF0gW0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gcmVjZWl2ZWQgbWVzc2FnZS4uLgo+Pj4+
Pj4gUkFXOgo+Pj4+Pj4gICBsZW5ndGggPSAyMTIKPj4+Pj4+ICAgZGF0YSAgID0gMDM6MDA6
MDA6ODA6RDQ6MDA6MDA6MDA6MDY6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6
QTI6ODk6Q0M6MzM6QkM6QkI6OEI6NEY6QjY6QjA6MTM6M0U6QzI6QUE6RTY6REY6MDE6MDA6
MDA6MDA6MDA6MDA6MDA6MDA6QTQ6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6
MDE6MDA6MDA6MDA6MDI6MDA6MDA6MDA6M0M6MDA6MDA6ODA6MDM6MDA6MDA6MDA6MDE6MDA6
MDA6MDA6MDg6MDA6MDA6MDA6NDA6MDA6MDA6MDA6MEE6MDA6MDA6MDA6NEM6MDA6MDA6MDA6
MUU6MDA6MDA6MDA6NkM6MDA6MDA6MDA6MkM6MDA6MDA6MDA6OTg6MDA6MDA6MDA6MEM6MDA6
MDA6MDA6NDg6MDA6NTM6MDA6NTA6MDA6NDE6MDA6MkI6MDA6MDA6MDA6Mzg6MDA6MzY6MDA6
Mzc6MDA6MzU6MDA6Mzg6MDA6MzA6MDA6MzA6MDA6MzU6MDA6MzA6MDA6Mzc6MDA6Mzc6MDA6
Mzk6MDA6MzQ6MDA6MzE6MDA6MzU6MDA6MDA6MDA6MzE6MDA6Mzg6MDA6MzU6MDA6MzA6MDA6
MzA6MDA6MkU6MDA6MzU6MDA6MzA6MDA6MzA6MDA6MzE6MDA6MkU6MDA6MzA6MDA6MzA6MDA6
MkU6MDA6MzA6MDA6MzU6MDA6MkU6MDA6MzI6MDA6Mzc6MDA6MkU6MDA6MzE6MDA6MzI6MDA6
NTY6MDA6MzE6MDA6MkU6MDA6MzA6MDA6MkU6MDA6MzQ6MDAKCgpbMTEgQXByIDIwMjQsIDAx
OjEzOjMwXSBbRGVidWddIFsvZGV2L2NkYy13ZG0wXSBubyB0cmFuc2FjdGlvbiBtYXRjaGVk
IGluIHJlY2VpdmVkIG1lc3NhZ2UKWzExIEFwciAyMDI0LCAwMToxMzozMF0gW0RlYnVnXSBb
L2Rldi9jZGMtd2RtMF0gcmVjZWl2ZWQgdW5leHBlY3RlZCBtZXNzYWdlICh0cmFuc2xhdGVk
KS4uLgo+Pj4+Pj4gSGVhZGVyOgo+Pj4+Pj4gICBsZW5ndGggICAgICA9IDIxMgo+Pj4+Pj4g
ICB0eXBlICAgICAgICA9IGNvbW1hbmQtZG9uZSAoMHg4MDAwMDAwMykKPj4+Pj4+ICAgdHJh
bnNhY3Rpb24gPSA2Cj4+Pj4+PiBGcmFnbWVudCBoZWFkZXI6Cj4+Pj4+PiAgIHRvdGFsICAg
PSAxCj4+Pj4+PiAgIGN1cnJlbnQgPSAwCj4+Pj4+PiBDb250ZW50czoKPj4+Pj4+ICAgc3Rh
dHVzIGVycm9yID0gJ05vbmUnICgweDAwMDAwMDAwKQo+Pj4+Pj4gICBzZXJ2aWNlICAgICAg
PSAnYmFzaWMtY29ubmVjdCcgKGEyODljYzMzLWJjYmItOGI0Zi1iNmIwLTEzM2VjMmFhZTZk
ZikKPj4+Pj4+ICAgY2lkICAgICAgICAgID0gJ2RldmljZS1jYXBzJyAoMHgwMDAwMDAwMSkK
Pj4+Pj4+IEZpZWxkczoKPj4+Pj4+ICAgRGV2aWNlVHlwZSA9ICdlbWJlZGRlZCcKPj4+Pj4+
ICAgQ2VsbHVsYXJDbGFzcyA9ICdnc20nCj4+Pj4+PiAgIFZvaWNlQ2xhc3MgPSAnbm8tdm9p
Y2UnCj4+Pj4+PiAgIFNpbUNsYXNzID0gJ3JlbW92YWJsZScKPj4+Pj4+ICAgRGF0YUNsYXNz
ID0gJ3VtdHMsIGhzZHBhLCBoc3VwYSwgbHRlLCBjdXN0b20nCj4+Pj4+PiAgIFNtc0NhcHMg
PSAncGR1LXJlY2VpdmUsIHBkdS1zZW5kJwo+Pj4+Pj4gICBDb250cm9sQ2FwcyA9ICdyZWct
bWFudWFsJwo+Pj4+Pj4gICBNYXhTZXNzaW9ucyA9ICc4Jwo+Pj4+Pj4gICBDdXN0b21EYXRh
Q2xhc3MgPSAnSFNQQSsnCj4+Pj4+PiAgIERldmljZUlkID0gJzg2NzU4MDA1MDc3OTQxNScK
Pj4+Pj4+ICAgRmlybXdhcmVJbmZvID0gJzE4NTAwLjUwMDEuMDAuMDUuMjcuMTInCj4+Pj4+
PiAgIEhhcmR3YXJlSW5mbyA9ICdWMS4wLjQnCgoKWzExIEFwciAyMDI0LCAwMToxMzozNV0g
W0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gbnVtYmVyIG9mIGNvbnNlY3V0aXZlIHRpbWVvdXRz
OiAyClsxMSBBcHIgMjAyNCwgMDE6MTM6MzVdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHNl
bnQgbWVzc2FnZS4uLgo8PDw8PDwgUkFXOgo8PDw8PDwgICBsZW5ndGggPSAxNgo8PDw8PDwg
ICBkYXRhICAgPSAwMTowMDowMDowMDoxMDowMDowMDowMDowMzowMDowMDowMDowMDowMjow
MDowMAoKClsxMSBBcHIgMjAyNCwgMDE6MTM6MzVdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBd
IHNlbnQgbWVzc2FnZSAodHJhbnNsYXRlZCkuLi4KPDw8PDw8IEhlYWRlcjoKPDw8PDw8ICAg
bGVuZ3RoICAgICAgPSAxNgo8PDw8PDwgICB0eXBlICAgICAgICA9IG9wZW4gKDB4MDAwMDAw
MDEpCjw8PDw8PCAgIHRyYW5zYWN0aW9uID0gMwo8PDw8PDwgQ29udGVudHM6Cjw8PDw8PCAg
IG1heCBjb250cm9sIHRyYW5zZmVyID0gNTEyCgoKWzExIEFwciAyMDI0LCAwMToxMzozNV0g
W0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gcmVjZWl2ZWQgbWVzc2FnZS4uLgo+Pj4+Pj4gUkFX
Ogo+Pj4+Pj4gICBsZW5ndGggPSAyMTIKPj4+Pj4+ICAgZGF0YSAgID0gMDM6MDA6MDA6ODA6
RDQ6MDA6MDA6MDA6MDc6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6QTI6ODk6
Q0M6MzM6QkM6QkI6OEI6NEY6QjY6QjA6MTM6M0U6QzI6QUE6RTY6REY6MDE6MDA6MDA6MDA6
MDA6MDA6MDA6MDA6QTQ6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6
MDA6MDA6MDI6MDA6MDA6MDA6M0M6MDA6MDA6ODA6MDM6MDA6MDA6MDA6MDE6MDA6MDA6MDA6
MDg6MDA6MDA6MDA6NDA6MDA6MDA6MDA6MEE6MDA6MDA6MDA6NEM6MDA6MDA6MDA6MUU6MDA6
MDA6MDA6NkM6MDA6MDA6MDA6MkM6MDA6MDA6MDA6OTg6MDA6MDA6MDA6MEM6MDA6MDA6MDA6
NDg6MDA6NTM6MDA6NTA6MDA6NDE6MDA6MkI6MDA6MDA6MDA6Mzg6MDA6MzY6MDA6Mzc6MDA6
MzU6MDA6Mzg6MDA6MzA6MDA6MzA6MDA6MzU6MDA6MzA6MDA6Mzc6MDA6Mzc6MDA6Mzk6MDA6
MzQ6MDA6MzE6MDA6MzU6MDA6MDA6MDA6MzE6MDA6Mzg6MDA6MzU6MDA6MzA6MDA6MzA6MDA6
MkU6MDA6MzU6MDA6MzA6MDA6MzA6MDA6MzE6MDA6MkU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6
MzA6MDA6MzU6MDA6MkU6MDA6MzI6MDA6Mzc6MDA6MkU6MDA6MzE6MDA6MzI6MDA6NTY6MDA6
MzE6MDA6MkU6MDA6MzA6MDA6MkU6MDA6MzQ6MDAKCgpbMTEgQXByIDIwMjQsIDAxOjEzOjM1
XSBbRGVidWddIFsvZGV2L2NkYy13ZG0wXSBubyB0cmFuc2FjdGlvbiBtYXRjaGVkIGluIHJl
Y2VpdmVkIG1lc3NhZ2UKWzExIEFwciAyMDI0LCAwMToxMzozNV0gW0RlYnVnXSBbL2Rldi9j
ZGMtd2RtMF0gcmVjZWl2ZWQgdW5leHBlY3RlZCBtZXNzYWdlICh0cmFuc2xhdGVkKS4uLgo+
Pj4+Pj4gSGVhZGVyOgo+Pj4+Pj4gICBsZW5ndGggICAgICA9IDIxMgo+Pj4+Pj4gICB0eXBl
ICAgICAgICA9IGNvbW1hbmQtZG9uZSAoMHg4MDAwMDAwMykKPj4+Pj4+ICAgdHJhbnNhY3Rp
b24gPSA3Cj4+Pj4+PiBGcmFnbWVudCBoZWFkZXI6Cj4+Pj4+PiAgIHRvdGFsICAgPSAxCj4+
Pj4+PiAgIGN1cnJlbnQgPSAwCj4+Pj4+PiBDb250ZW50czoKPj4+Pj4+ICAgc3RhdHVzIGVy
cm9yID0gJ05vbmUnICgweDAwMDAwMDAwKQo+Pj4+Pj4gICBzZXJ2aWNlICAgICAgPSAnYmFz
aWMtY29ubmVjdCcgKGEyODljYzMzLWJjYmItOGI0Zi1iNmIwLTEzM2VjMmFhZTZkZikKPj4+
Pj4+ICAgY2lkICAgICAgICAgID0gJ2RldmljZS1jYXBzJyAoMHgwMDAwMDAwMSkKPj4+Pj4+
IEZpZWxkczoKPj4+Pj4+ICAgRGV2aWNlVHlwZSA9ICdlbWJlZGRlZCcKPj4+Pj4+ICAgQ2Vs
bHVsYXJDbGFzcyA9ICdnc20nCj4+Pj4+PiAgIFZvaWNlQ2xhc3MgPSAnbm8tdm9pY2UnCj4+
Pj4+PiAgIFNpbUNsYXNzID0gJ3JlbW92YWJsZScKPj4+Pj4+ICAgRGF0YUNsYXNzID0gJ3Vt
dHMsIGhzZHBhLCBoc3VwYSwgbHRlLCBjdXN0b20nCj4+Pj4+PiAgIFNtc0NhcHMgPSAncGR1
LXJlY2VpdmUsIHBkdS1zZW5kJwo+Pj4+Pj4gICBDb250cm9sQ2FwcyA9ICdyZWctbWFudWFs
Jwo+Pj4+Pj4gICBNYXhTZXNzaW9ucyA9ICc4Jwo+Pj4+Pj4gICBDdXN0b21EYXRhQ2xhc3Mg
PSAnSFNQQSsnCj4+Pj4+PiAgIERldmljZUlkID0gJzg2NzU4MDA1MDc3OTQxNScKPj4+Pj4+
ICAgRmlybXdhcmVJbmZvID0gJzE4NTAwLjUwMDEuMDAuMDUuMjcuMTInCj4+Pj4+PiAgIEhh
cmR3YXJlSW5mbyA9ICdWMS4wLjQnCgoKWzExIEFwciAyMDI0LCAwMToxMzo0MF0gW0RlYnVn
XSBbL2Rldi9jZGMtd2RtMF0gbnVtYmVyIG9mIGNvbnNlY3V0aXZlIHRpbWVvdXRzOiAzClsx
MSBBcHIgMjAyNCwgMDE6MTM6NDBdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHNlbnQgbWVz
c2FnZS4uLgo8PDw8PDwgUkFXOgo8PDw8PDwgICBsZW5ndGggPSAxNgo8PDw8PDwgICBkYXRh
ICAgPSAwMTowMDowMDowMDoxMDowMDowMDowMDowNDowMDowMDowMDowMDowMjowMDowMAoK
ClsxMSBBcHIgMjAyNCwgMDE6MTM6NDBdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHNlbnQg
bWVzc2FnZSAodHJhbnNsYXRlZCkuLi4KPDw8PDw8IEhlYWRlcjoKPDw8PDw8ICAgbGVuZ3Ro
ICAgICAgPSAxNgo8PDw8PDwgICB0eXBlICAgICAgICA9IG9wZW4gKDB4MDAwMDAwMDEpCjw8
PDw8PCAgIHRyYW5zYWN0aW9uID0gNAo8PDw8PDwgQ29udGVudHM6Cjw8PDw8PCAgIG1heCBj
b250cm9sIHRyYW5zZmVyID0gNTEyCgoKWzExIEFwciAyMDI0LCAwMToxMzo0MF0gW0RlYnVn
XSBbL2Rldi9jZGMtd2RtMF0gcmVjZWl2ZWQgbWVzc2FnZS4uLgo+Pj4+Pj4gUkFXOgo+Pj4+
Pj4gICBsZW5ndGggPSAyMTIKPj4+Pj4+ICAgZGF0YSAgID0gMDM6MDA6MDA6ODA6RDQ6MDA6
MDA6MDA6MDg6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6QTI6ODk6Q0M6MzM6
QkM6QkI6OEI6NEY6QjY6QjA6MTM6M0U6QzI6QUE6RTY6REY6MDE6MDA6MDA6MDA6MDA6MDA6
MDA6MDA6QTQ6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6
MDI6MDA6MDA6MDA6M0M6MDA6MDA6ODA6MDM6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDg6MDA6
MDA6MDA6NDA6MDA6MDA6MDA6MEE6MDA6MDA6MDA6NEM6MDA6MDA6MDA6MUU6MDA6MDA6MDA6
NkM6MDA6MDA6MDA6MkM6MDA6MDA6MDA6OTg6MDA6MDA6MDA6MEM6MDA6MDA6MDA6NDg6MDA6
NTM6MDA6NTA6MDA6NDE6MDA6MkI6MDA6MDA6MDA6Mzg6MDA6MzY6MDA6Mzc6MDA6MzU6MDA6
Mzg6MDA6MzA6MDA6MzA6MDA6MzU6MDA6MzA6MDA6Mzc6MDA6Mzc6MDA6Mzk6MDA6MzQ6MDA6
MzE6MDA6MzU6MDA6MDA6MDA6MzE6MDA6Mzg6MDA6MzU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6
MzU6MDA6MzA6MDA6MzA6MDA6MzE6MDA6MkU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6MzA6MDA6
MzU6MDA6MkU6MDA6MzI6MDA6Mzc6MDA6MkU6MDA6MzE6MDA6MzI6MDA6NTY6MDA6MzE6MDA6
MkU6MDA6MzA6MDA6MkU6MDA6MzQ6MDAKCgpbMTEgQXByIDIwMjQsIDAxOjEzOjQwXSBbRGVi
dWddIFsvZGV2L2NkYy13ZG0wXSBubyB0cmFuc2FjdGlvbiBtYXRjaGVkIGluIHJlY2VpdmVk
IG1lc3NhZ2UKWzExIEFwciAyMDI0LCAwMToxMzo0MF0gW0RlYnVnXSBbL2Rldi9jZGMtd2Rt
MF0gcmVjZWl2ZWQgdW5leHBlY3RlZCBtZXNzYWdlICh0cmFuc2xhdGVkKS4uLgo+Pj4+Pj4g
SGVhZGVyOgo+Pj4+Pj4gICBsZW5ndGggICAgICA9IDIxMgo+Pj4+Pj4gICB0eXBlICAgICAg
ICA9IGNvbW1hbmQtZG9uZSAoMHg4MDAwMDAwMykKPj4+Pj4+ICAgdHJhbnNhY3Rpb24gPSA4
Cj4+Pj4+PiBGcmFnbWVudCBoZWFkZXI6Cj4+Pj4+PiAgIHRvdGFsICAgPSAxCj4+Pj4+PiAg
IGN1cnJlbnQgPSAwCj4+Pj4+PiBDb250ZW50czoKPj4+Pj4+ICAgc3RhdHVzIGVycm9yID0g
J05vbmUnICgweDAwMDAwMDAwKQo+Pj4+Pj4gICBzZXJ2aWNlICAgICAgPSAnYmFzaWMtY29u
bmVjdCcgKGEyODljYzMzLWJjYmItOGI0Zi1iNmIwLTEzM2VjMmFhZTZkZikKPj4+Pj4+ICAg
Y2lkICAgICAgICAgID0gJ2RldmljZS1jYXBzJyAoMHgwMDAwMDAwMSkKPj4+Pj4+IEZpZWxk
czoKPj4+Pj4+ICAgRGV2aWNlVHlwZSA9ICdlbWJlZGRlZCcKPj4+Pj4+ICAgQ2VsbHVsYXJD
bGFzcyA9ICdnc20nCj4+Pj4+PiAgIFZvaWNlQ2xhc3MgPSAnbm8tdm9pY2UnCj4+Pj4+PiAg
IFNpbUNsYXNzID0gJ3JlbW92YWJsZScKPj4+Pj4+ICAgRGF0YUNsYXNzID0gJ3VtdHMsIGhz
ZHBhLCBoc3VwYSwgbHRlLCBjdXN0b20nCj4+Pj4+PiAgIFNtc0NhcHMgPSAncGR1LXJlY2Vp
dmUsIHBkdS1zZW5kJwo+Pj4+Pj4gICBDb250cm9sQ2FwcyA9ICdyZWctbWFudWFsJwo+Pj4+
Pj4gICBNYXhTZXNzaW9ucyA9ICc4Jwo+Pj4+Pj4gICBDdXN0b21EYXRhQ2xhc3MgPSAnSFNQ
QSsnCj4+Pj4+PiAgIERldmljZUlkID0gJzg2NzU4MDA1MDc3OTQxNScKPj4+Pj4+ICAgRmly
bXdhcmVJbmZvID0gJzE4NTAwLjUwMDEuMDAuMDUuMjcuMTInCj4+Pj4+PiAgIEhhcmR3YXJl
SW5mbyA9ICdWMS4wLjQnCgoKWzExIEFwciAyMDI0LCAwMToxMzo0NF0gW0RlYnVnXSBbL2Rl
di9jZGMtd2RtMF0gcmVjZWl2ZWQgbWVzc2FnZS4uLgo+Pj4+Pj4gUkFXOgo+Pj4+Pj4gICBs
ZW5ndGggPSAyMTIKPj4+Pj4+ICAgZGF0YSAgID0gMDM6MDA6MDA6ODA6RDQ6MDA6MDA6MDA6
MDk6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6QTI6ODk6Q0M6MzM6QkM6QkI6
OEI6NEY6QjY6QjA6MTM6M0U6QzI6QUE6RTY6REY6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6
QTQ6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDI6MDA6
MDA6MDA6M0M6MDA6MDA6ODA6MDM6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDg6MDA6MDA6MDA6
NDA6MDA6MDA6MDA6MEE6MDA6MDA6MDA6NEM6MDA6MDA6MDA6MUU6MDA6MDA6MDA6NkM6MDA6
MDA6MDA6MkM6MDA6MDA6MDA6OTg6MDA6MDA6MDA6MEM6MDA6MDA6MDA6NDg6MDA6NTM6MDA6
NTA6MDA6NDE6MDA6MkI6MDA6MDA6MDA6Mzg6MDA6MzY6MDA6Mzc6MDA6MzU6MDA6Mzg6MDA6
MzA6MDA6MzA6MDA6MzU6MDA6MzA6MDA6Mzc6MDA6Mzc6MDA6Mzk6MDA6MzQ6MDA6MzE6MDA6
MzU6MDA6MDA6MDA6MzE6MDA6Mzg6MDA6MzU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6MzU6MDA6
MzA6MDA6MzA6MDA6MzE6MDA6MkU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6MzA6MDA6MzU6MDA6
MkU6MDA6MzI6MDA6Mzc6MDA6MkU6MDA6MzE6MDA6MzI6MDA6NTY6MDA6MzE6MDA6MkU6MDA6
MzA6MDA6MkU6MDA6MzQ6MDAKCgpbMTEgQXByIDIwMjQsIDAxOjEzOjQ0XSBbRGVidWddIFsv
ZGV2L2NkYy13ZG0wXSBubyB0cmFuc2FjdGlvbiBtYXRjaGVkIGluIHJlY2VpdmVkIG1lc3Nh
Z2UKWzExIEFwciAyMDI0LCAwMToxMzo0NF0gW0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gcmVj
ZWl2ZWQgdW5leHBlY3RlZCBtZXNzYWdlICh0cmFuc2xhdGVkKS4uLgo+Pj4+Pj4gSGVhZGVy
Ogo+Pj4+Pj4gICBsZW5ndGggICAgICA9IDIxMgo+Pj4+Pj4gICB0eXBlICAgICAgICA9IGNv
bW1hbmQtZG9uZSAoMHg4MDAwMDAwMykKPj4+Pj4+ICAgdHJhbnNhY3Rpb24gPSA5Cj4+Pj4+
PiBGcmFnbWVudCBoZWFkZXI6Cj4+Pj4+PiAgIHRvdGFsICAgPSAxCj4+Pj4+PiAgIGN1cnJl
bnQgPSAwCj4+Pj4+PiBDb250ZW50czoKPj4+Pj4+ICAgc3RhdHVzIGVycm9yID0gJ05vbmUn
ICgweDAwMDAwMDAwKQo+Pj4+Pj4gICBzZXJ2aWNlICAgICAgPSAnYmFzaWMtY29ubmVjdCcg
KGEyODljYzMzLWJjYmItOGI0Zi1iNmIwLTEzM2VjMmFhZTZkZikKPj4+Pj4+ICAgY2lkICAg
ICAgICAgID0gJ2RldmljZS1jYXBzJyAoMHgwMDAwMDAwMSkKPj4+Pj4+IEZpZWxkczoKPj4+
Pj4+ICAgRGV2aWNlVHlwZSA9ICdlbWJlZGRlZCcKPj4+Pj4+ICAgQ2VsbHVsYXJDbGFzcyA9
ICdnc20nCj4+Pj4+PiAgIFZvaWNlQ2xhc3MgPSAnbm8tdm9pY2UnCj4+Pj4+PiAgIFNpbUNs
YXNzID0gJ3JlbW92YWJsZScKPj4+Pj4+ICAgRGF0YUNsYXNzID0gJ3VtdHMsIGhzZHBhLCBo
c3VwYSwgbHRlLCBjdXN0b20nCj4+Pj4+PiAgIFNtc0NhcHMgPSAncGR1LXJlY2VpdmUsIHBk
dS1zZW5kJwo+Pj4+Pj4gICBDb250cm9sQ2FwcyA9ICdyZWctbWFudWFsJwo+Pj4+Pj4gICBN
YXhTZXNzaW9ucyA9ICc4Jwo+Pj4+Pj4gICBDdXN0b21EYXRhQ2xhc3MgPSAnSFNQQSsnCj4+
Pj4+PiAgIERldmljZUlkID0gJzg2NzU4MDA1MDc3OTQxNScKPj4+Pj4+ICAgRmlybXdhcmVJ
bmZvID0gJzE4NTAwLjUwMDEuMDAuMDUuMjcuMTInCj4+Pj4+PiAgIEhhcmR3YXJlSW5mbyA9
ICdWMS4wLjQnCgoKWzExIEFwciAyMDI0LCAwMToxMzo0NV0gW0RlYnVnXSBbL2Rldi9jZGMt
d2RtMF0gbnVtYmVyIG9mIGNvbnNlY3V0aXZlIHRpbWVvdXRzOiA0ClsxMSBBcHIgMjAyNCwg
MDE6MTM6NDVdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHNlbnQgbWVzc2FnZS4uLgo8PDw8
PDwgUkFXOgo8PDw8PDwgICBsZW5ndGggPSAxNgo8PDw8PDwgICBkYXRhICAgPSAwMTowMDow
MDowMDoxMDowMDowMDowMDowNTowMDowMDowMDowMDowMjowMDowMAoKClsxMSBBcHIgMjAy
NCwgMDE6MTM6NDVdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHNlbnQgbWVzc2FnZSAodHJh
bnNsYXRlZCkuLi4KPDw8PDw8IEhlYWRlcjoKPDw8PDw8ICAgbGVuZ3RoICAgICAgPSAxNgo8
PDw8PDwgICB0eXBlICAgICAgICA9IG9wZW4gKDB4MDAwMDAwMDEpCjw8PDw8PCAgIHRyYW5z
YWN0aW9uID0gNQo8PDw8PDwgQ29udGVudHM6Cjw8PDw8PCAgIG1heCBjb250cm9sIHRyYW5z
ZmVyID0gNTEyCgoKWzExIEFwciAyMDI0LCAwMToxMzo0NV0gW0RlYnVnXSBbL2Rldi9jZGMt
d2RtMF0gcmVjZWl2ZWQgbWVzc2FnZS4uLgo+Pj4+Pj4gUkFXOgo+Pj4+Pj4gICBsZW5ndGgg
PSAyMTIKPj4+Pj4+ICAgZGF0YSAgID0gMDM6MDA6MDA6ODA6RDQ6MDA6MDA6MDA6MEE6MDA6
MDA6MDA6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6QTI6ODk6Q0M6MzM6QkM6QkI6OEI6NEY6
QjY6QjA6MTM6M0U6QzI6QUE6RTY6REY6MDE6MDA6MDA6MDA6MDA6MDA6MDA6MDA6QTQ6MDA6
MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDI6MDA6MDA6MDA6
M0M6MDA6MDA6ODA6MDM6MDA6MDA6MDA6MDE6MDA6MDA6MDA6MDg6MDA6MDA6MDA6NDA6MDA6
MDA6MDA6MEE6MDA6MDA6MDA6NEM6MDA6MDA6MDA6MUU6MDA6MDA6MDA6NkM6MDA6MDA6MDA6
MkM6MDA6MDA6MDA6OTg6MDA6MDA6MDA6MEM6MDA6MDA6MDA6NDg6MDA6NTM6MDA6NTA6MDA6
NDE6MDA6MkI6MDA6MDA6MDA6Mzg6MDA6MzY6MDA6Mzc6MDA6MzU6MDA6Mzg6MDA6MzA6MDA6
MzA6MDA6MzU6MDA6MzA6MDA6Mzc6MDA6Mzc6MDA6Mzk6MDA6MzQ6MDA6MzE6MDA6MzU6MDA6
MDA6MDA6MzE6MDA6Mzg6MDA6MzU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6MzU6MDA6MzA6MDA6
MzA6MDA6MzE6MDA6MkU6MDA6MzA6MDA6MzA6MDA6MkU6MDA6MzA6MDA6MzU6MDA6MkU6MDA6
MzI6MDA6Mzc6MDA6MkU6MDA6MzE6MDA6MzI6MDA6NTY6MDA6MzE6MDA6MkU6MDA6MzA6MDA6
MkU6MDA6MzQ6MDAKCgpbMTEgQXByIDIwMjQsIDAxOjEzOjQ1XSBbRGVidWddIFsvZGV2L2Nk
Yy13ZG0wXSBubyB0cmFuc2FjdGlvbiBtYXRjaGVkIGluIHJlY2VpdmVkIG1lc3NhZ2UKWzEx
IEFwciAyMDI0LCAwMToxMzo0NV0gW0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gcmVjZWl2ZWQg
dW5leHBlY3RlZCBtZXNzYWdlICh0cmFuc2xhdGVkKS4uLgo+Pj4+Pj4gSGVhZGVyOgo+Pj4+
Pj4gICBsZW5ndGggICAgICA9IDIxMgo+Pj4+Pj4gICB0eXBlICAgICAgICA9IGNvbW1hbmQt
ZG9uZSAoMHg4MDAwMDAwMykKPj4+Pj4+ICAgdHJhbnNhY3Rpb24gPSAxMAo+Pj4+Pj4gRnJh
Z21lbnQgaGVhZGVyOgo+Pj4+Pj4gICB0b3RhbCAgID0gMQo+Pj4+Pj4gICBjdXJyZW50ID0g
MAo+Pj4+Pj4gQ29udGVudHM6Cj4+Pj4+PiAgIHN0YXR1cyBlcnJvciA9ICdOb25lJyAoMHgw
MDAwMDAwMCkKPj4+Pj4+ICAgc2VydmljZSAgICAgID0gJ2Jhc2ljLWNvbm5lY3QnIChhMjg5
Y2MzMy1iY2JiLThiNGYtYjZiMC0xMzNlYzJhYWU2ZGYpCj4+Pj4+PiAgIGNpZCAgICAgICAg
ICA9ICdkZXZpY2UtY2FwcycgKDB4MDAwMDAwMDEpCj4+Pj4+PiBGaWVsZHM6Cj4+Pj4+PiAg
IERldmljZVR5cGUgPSAnZW1iZWRkZWQnCj4+Pj4+PiAgIENlbGx1bGFyQ2xhc3MgPSAnZ3Nt
Jwo+Pj4+Pj4gICBWb2ljZUNsYXNzID0gJ25vLXZvaWNlJwo+Pj4+Pj4gICBTaW1DbGFzcyA9
ICdyZW1vdmFibGUnCj4+Pj4+PiAgIERhdGFDbGFzcyA9ICd1bXRzLCBoc2RwYSwgaHN1cGEs
IGx0ZSwgY3VzdG9tJwo+Pj4+Pj4gICBTbXNDYXBzID0gJ3BkdS1yZWNlaXZlLCBwZHUtc2Vu
ZCcKPj4+Pj4+ICAgQ29udHJvbENhcHMgPSAncmVnLW1hbnVhbCcKPj4+Pj4+ICAgTWF4U2Vz
c2lvbnMgPSAnOCcKPj4+Pj4+ICAgQ3VzdG9tRGF0YUNsYXNzID0gJ0hTUEErJwo+Pj4+Pj4g
ICBEZXZpY2VJZCA9ICc4Njc1ODAwNTA3Nzk0MTUnCj4+Pj4+PiAgIEZpcm13YXJlSW5mbyA9
ICcxODUwMC41MDAxLjAwLjA1LjI3LjEyJwo+Pj4+Pj4gICBIYXJkd2FyZUluZm8gPSAnVjEu
MC40JwoKClsxMSBBcHIgMjAyNCwgMDE6MTM6NTBdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBd
IG51bWJlciBvZiBjb25zZWN1dGl2ZSB0aW1lb3V0czogNQpbMTEgQXByIDIwMjQsIDAxOjEz
OjUwXSBbRGVidWddIFsvZGV2L2NkYy13ZG0wXSBzZW50IG1lc3NhZ2UuLi4KPDw8PDw8IFJB
VzoKPDw8PDw8ICAgbGVuZ3RoID0gMTYKPDw8PDw8ICAgZGF0YSAgID0gMDE6MDA6MDA6MDA6
MTA6MDA6MDA6MDA6MDY6MDA6MDA6MDA6MDA6MDI6MDA6MDAKCgpbMTEgQXByIDIwMjQsIDAx
OjEzOjUwXSBbRGVidWddIFsvZGV2L2NkYy13ZG0wXSBzZW50IG1lc3NhZ2UgKHRyYW5zbGF0
ZWQpLi4uCjw8PDw8PCBIZWFkZXI6Cjw8PDw8PCAgIGxlbmd0aCAgICAgID0gMTYKPDw8PDw8
ICAgdHlwZSAgICAgICAgPSBvcGVuICgweDAwMDAwMDAxKQo8PDw8PDwgICB0cmFuc2FjdGlv
biA9IDYKPDw8PDw8IENvbnRlbnRzOgo8PDw8PDwgICBtYXggY29udHJvbCB0cmFuc2ZlciA9
IDUxMgoKClsxMSBBcHIgMjAyNCwgMDE6MTM6NTRdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBd
IHJlY2VpdmVkIG1lc3NhZ2UuLi4KPj4+Pj4+IFJBVzoKPj4+Pj4+ICAgbGVuZ3RoID0gMjEy
Cj4+Pj4+PiAgIGRhdGEgICA9IDAzOjAwOjAwOjgwOkQ0OjAwOjAwOjAwOjBEOjAwOjAwOjAw
OjAxOjAwOjAwOjAwOjAwOjAwOjAwOjAwOkEyOjg5OkNDOjMzOkJDOkJCOjhCOjRGOkI2OkIw
OjEzOjNFOkMyOkFBOkU2OkRGOjAxOjAwOjAwOjAwOjAwOjAwOjAwOjAwOkE0OjAwOjAwOjAw
OjAxOjAwOjAwOjAwOjAxOjAwOjAwOjAwOjAxOjAwOjAwOjAwOjAyOjAwOjAwOjAwOjNDOjAw
OjAwOjgwOjAzOjAwOjAwOjAwOjAxOjAwOjAwOjAwOjA4OjAwOjAwOjAwOjQwOjAwOjAwOjAw
OjBBOjAwOjAwOjAwOjRDOjAwOjAwOjAwOjFFOjAwOjAwOjAwOjZDOjAwOjAwOjAwOjJDOjAw
OjAwOjAwOjk4OjAwOjAwOjAwOjBDOjAwOjAwOjAwOjQ4OjAwOjUzOjAwOjUwOjAwOjQxOjAw
OjJCOjAwOjAwOjAwOjM4OjAwOjM2OjAwOjM3OjAwOjM1OjAwOjM4OjAwOjMwOjAwOjMwOjAw
OjM1OjAwOjMwOjAwOjM3OjAwOjM3OjAwOjM5OjAwOjM0OjAwOjMxOjAwOjM1OjAwOjAwOjAw
OjMxOjAwOjM4OjAwOjM1OjAwOjMwOjAwOjMwOjAwOjJFOjAwOjM1OjAwOjMwOjAwOjMwOjAw
OjMxOjAwOjJFOjAwOjMwOjAwOjMwOjAwOjJFOjAwOjMwOjAwOjM1OjAwOjJFOjAwOjMyOjAw
OjM3OjAwOjJFOjAwOjMxOjAwOjMyOjAwOjU2OjAwOjMxOjAwOjJFOjAwOjMwOjAwOjJFOjAw
OjM0OjAwCgoKWzExIEFwciAyMDI0LCAwMToxMzo1NF0gW0RlYnVnXSBbL2Rldi9jZGMtd2Rt
MF0gbm8gdHJhbnNhY3Rpb24gbWF0Y2hlZCBpbiByZWNlaXZlZCBtZXNzYWdlClsxMSBBcHIg
MjAyNCwgMDE6MTM6NTRdIFtEZWJ1Z10gWy9kZXYvY2RjLXdkbTBdIHJlY2VpdmVkIHVuZXhw
ZWN0ZWQgbWVzc2FnZSAodHJhbnNsYXRlZCkuLi4KPj4+Pj4+IEhlYWRlcjoKPj4+Pj4+ICAg
bGVuZ3RoICAgICAgPSAyMTIKPj4+Pj4+ICAgdHlwZSAgICAgICAgPSBjb21tYW5kLWRvbmUg
KDB4ODAwMDAwMDMpCj4+Pj4+PiAgIHRyYW5zYWN0aW9uID0gMTMKPj4+Pj4+IEZyYWdtZW50
IGhlYWRlcjoKPj4+Pj4+ICAgdG90YWwgICA9IDEKPj4+Pj4+ICAgY3VycmVudCA9IDAKPj4+
Pj4+IENvbnRlbnRzOgo+Pj4+Pj4gICBzdGF0dXMgZXJyb3IgPSAnTm9uZScgKDB4MDAwMDAw
MDApCj4+Pj4+PiAgIHNlcnZpY2UgICAgICA9ICdiYXNpYy1jb25uZWN0JyAoYTI4OWNjMzMt
YmNiYi04YjRmLWI2YjAtMTMzZWMyYWFlNmRmKQo+Pj4+Pj4gICBjaWQgICAgICAgICAgPSAn
ZGV2aWNlLWNhcHMnICgweDAwMDAwMDAxKQo+Pj4+Pj4gRmllbGRzOgo+Pj4+Pj4gICBEZXZp
Y2VUeXBlID0gJ2VtYmVkZGVkJwo+Pj4+Pj4gICBDZWxsdWxhckNsYXNzID0gJ2dzbScKPj4+
Pj4+ICAgVm9pY2VDbGFzcyA9ICduby12b2ljZScKPj4+Pj4+ICAgU2ltQ2xhc3MgPSAncmVt
b3ZhYmxlJwo+Pj4+Pj4gICBEYXRhQ2xhc3MgPSAndW10cywgaHNkcGEsIGhzdXBhLCBsdGUs
IGN1c3RvbScKPj4+Pj4+ICAgU21zQ2FwcyA9ICdwZHUtcmVjZWl2ZSwgcGR1LXNlbmQnCj4+
Pj4+PiAgIENvbnRyb2xDYXBzID0gJ3JlZy1tYW51YWwnCj4+Pj4+PiAgIE1heFNlc3Npb25z
ID0gJzgnCj4+Pj4+PiAgIEN1c3RvbURhdGFDbGFzcyA9ICdIU1BBKycKPj4+Pj4+ICAgRGV2
aWNlSWQgPSAnODY3NTgwMDUwNzc5NDE1Jwo+Pj4+Pj4gICBGaXJtd2FyZUluZm8gPSAnMTg1
MDAuNTAwMS4wMC4wNS4yNy4xMicKPj4+Pj4+ICAgSGFyZHdhcmVJbmZvID0gJ1YxLjAuNCcK
CgpbMTEgQXByIDIwMjQsIDAxOjEzOjU1XSBbRGVidWddIFsvZGV2L2NkYy13ZG0wXSBudW1i
ZXIgb2YgY29uc2VjdXRpdmUgdGltZW91dHM6IDYKWzExIEFwciAyMDI0LCAwMToxMzo1NV0g
W0RlYnVnXSBbL2Rldi9jZGMtd2RtMF0gb3BlbiBvcGVyYXRpb24gdGltZWQgb3V0OiBjbG9z
ZWQKZXJyb3I6IGNvdWxkbid0IG9wZW4gdGhlIE1iaW1EZXZpY2U6IE9wZXJhdGlvbiB0aW1l
ZCBvdXQ6IGRldmljZSBpcyBjbG9zZWQKCg==
--------------plWNZDNC0kd0sX0NgosYGxl2
Content-Type: application/pgp-keys; name="OpenPGP_0xAECE0239C6606AD5.asc"
Content-Disposition: attachment; filename="OpenPGP_0xAECE0239C6606AD5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
MGUY
=3DEvOL
-----END PGP PUBLIC KEY BLOCK-----

--------------plWNZDNC0kd0sX0NgosYGxl2--

--------------BGoFk61pypwDw2TBE0Zi64vT--

--------------abHSOwEfOBjnuC3tZQm7RPx7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEqBTQm5xbwBlFpkMIrs4COcZgatUFAmYcvi4FAwAAAAAACgkQrs4COcZgatXM
eg/+P3k2C69d2gL8yhI7hVcKTt1UzjrvDX8xBJSDcn2OvR0gvSwGn4hQbOfkJjJzHR6dlG1J7v26
2ExCwm1IONBLtvW5/5TNJma1hksc06b31JvPSmwxH7VdgjRwQoAxQ81U23pC7IF9+SCxWzxYly9F
Egt9x3totBZgiewYeg58KH1LK/aT9yvAvSdkLolS6RQlrGLmi79EKwTDgtbm3gZNfeZRwWgbAyLE
oT9GZDKySuwkysONxUr8YY3xi7DOeTs0I9ag/ZGE6561PsfyhB9KGkfxNKYFJMiZJI6VJX1vB1LK
wp2FBCMIjls8YtTMzHmqK9MMQzLhNCqd/vOYhqJtLlHeiHlOwEaOwfuc9MXgv6Feb5kVOYBS4VgL
ppKc2sWcs+nj02VkVanMyTNsRrqp+z10N0B0fWN2p/VWOIvruG0q7t59oPlSxx9l2pGuAxN28Ngf
qHD+cdiz95XkcLUMFO9NqnaYETluMUToBp8Vfy71zwTRDE+w1xZ4X5SQUIIQTfQDW/thwno6ZUqk
e4JQrCAQeY67I0DDQq8OaQz/56qHIKRWaQ7W6S2Zx1PnKwU6c8mVcL1N2/QV/zLQ/GR/1ugwROg0
OGWPR6GX38UhRy4ocQIRUGiviJ9ETKtxrEGKfX23s5vkL4Y5wlyzVCexhR4TL/w8q2PdiWt5hx2G
Moo=
=7PXU
-----END PGP SIGNATURE-----

--------------abHSOwEfOBjnuC3tZQm7RPx7--

