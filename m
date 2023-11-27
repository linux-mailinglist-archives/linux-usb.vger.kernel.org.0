Return-Path: <linux-usb+bounces-3378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 169507FA94B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 19:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03F81F20F10
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 18:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F7C3C6A3;
	Mon, 27 Nov 2023 18:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="j7BjkE4r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69381D51;
	Mon, 27 Nov 2023 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701111139; x=1701715939; i=wahrenst@gmx.net;
	bh=zgQ46fZfr/CiBcyEnxMyauIj38My1M/FDk/PQg+sgSY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=j7BjkE4rEpYsgkWryDvl2t2rTGx7YYo6Z8IXMsBXTwwzxiqV4BX1pnfhgtRqc/H1
	 h0jjIt9+A41qeZolxE//J0l+gIyYUnQm4Dmp9rsBCRAPjbsu6sPE0h4JsQg8dMU9r
	 h1+fQ2W8lhrrqJWCpOLsFuAp3sBwDkVhhjtoTigsQnNf6TtE5qNsbH7GJ/6sg1YzO
	 Lkj+cmgngBllg/c/GpPmn8siuTs422MHWojVFUkcEoIBmoAH+Q6k3TF76Wc7FhtvI
	 E32V0UO/+uW/dQP6w6eqMWY4bgKWKTt7sUPtZHMsbp+fkfN31jxJcVUS21T4Xs03a
	 yhIBxF9jMbIG/twjfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1rGFN51NVA-00zmGa; Mon, 27
 Nov 2023 19:52:19 +0100
Message-ID: <7ea67bce-9b19-4bd6-98cf-10fe85ab8298@gmx.net>
Date: Mon, 27 Nov 2023 19:52:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Cyril Brulebois <kibi@debian.org>
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
 <20231127115538.npv23hhn7jfrk3fc@mraw.org>
 <892c2e2f-3187-491b-b464-56d099b6fd49@gmx.net>
 <20231127130225.lyk2jngfru5lw6sd@mraw.org>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231127130225.lyk2jngfru5lw6sd@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:xnnOzTGdtR3Q0fQO6C+En1vLkbnWIscJ+Z4aH3jGFu4H9HmsXB8
 6oXHqt6oQLDcncQ7cTBlgKOb7yRRW4Z77gR3qvjBw+OPZVys+ZxGYjZzl704FEj8MSNiaJx
 XP3e1iKkU77oo380lIvPmeRkLkDnIVZn4UxchnVEDFLC9oxcxveOaPsdwLN2ZSQKvmJmOU0
 X14FQYl71DWZ11DiRteXA==
UI-OutboundReport: notjunk:1;M01:P0:KEesNfuao8c=;cdsTqmwYkAxcT/vQpXAHJ0AgRnr
 yBaDn4UOqKtLlFY+iSSYi3Do3DTBmUih5KrUUq4w3Ex3UJi7ql14fl5v71joveS+S4bMK4eNR
 3q27Q2DMbBJIv2XdW6xy1cIFAthTRAShxyyLPZwunbzSaZbDtrbPxsxIK1zUPzsr1y5SU7EUN
 7db5VkiRsbqZOv5iozYXniDKMnAY5RfFV8c5Om/ZyOCj7/wQG57X+28Wh1KApJRc/3iFmOuK2
 UC/nVQHvKPbhZF7BnQsaj8zY9INmeh6JTedvLvTjIEnWqYrgouqjF74/nSC//tlI63zLj1cyK
 Q2NlazeYdvEAH5yaIi9MShoKcO8G9DJ6rV8kLeVVKemqw7bWvirZ2SicyOjIrONltPMQSEOrn
 Im+DHP7D60xv9W2p6/Q+EnBv4OKYh6jNvaxio67Bzh0qe7d83/9BT0QoV7/roi8CQB6VIn8wi
 Sm0PJ6BErxFFiL3LwZp0FTWiuvO8DEEJvsR3Q5n6JLVeFMthaB+KRtA5nGGa9Jc0jAEnADcQT
 Ml4evyqTcgdssBB76lTWre9QrPs/yYEzuZPJ+pEPAlGCnBmW7fX+92/7Sw0Gq3cy5zRre/7TV
 fDc0QmGCuvkMP5v0OIvc3YXlXhWIXu1RhlkjeZeTfputGPzC7cMbwJqgJRAUYNivUV5LA0ynv
 8HPmpU4ASASyLUlGco8mXAOL3Y0PGkk51AxzTBc+w4FddWqKodYFuB3Ana5HUtenzHY5komZu
 loNulPhF3F7orDgaEm+EPB2l/V214C4TuLnW36/LTQEoHxAIULku2azu28CEvtp2JgUFZ0Ph7
 AfY4Lf4/+i6KL1DUGbgdxEvVIFWgmjaXqeuZkxwGr4ulCS2+fnNFx5ra4fYFmZabN41VMjD0W
 bXDel9StaItRWyHGbxVTV8qwBxC84HrQMXwu2LZYDq2voCdSELAvo/tbPHTCipe8SsHIycNio
 eGl4ww==

SGksDQoNCmV2ZW4gYWZ0ZXIgQ3lyaWwgZ2V0IG1hbmFnZWQgdG8gZ2V0IHhIQ0kgcnVubmluZy4g
SSBub3RpY2VkIGEgaXNzdWUuIElmIA0KaSBjb21waWxlIHhoY2kgYXMgYSBrZXJuZWwgbW9kdWxl
IGZvciBhcm02NDoNCg0KIw0KIyBVU0IgSG9zdCBDb250cm9sbGVyIERyaXZlcnMNCiMNCiMgQ09O
RklHX1VTQl9DNjdYMDBfSENEIGlzIG5vdCBzZXQNCkNPTkZJR19VU0JfWEhDSV9IQ0Q9bQ0KIyBD
T05GSUdfVVNCX1hIQ0lfREJHQ0FQIGlzIG5vdCBzZXQNCkNPTkZJR19VU0JfWEhDSV9QQ0k9bQ0K
Q09ORklHX1VTQl9YSENJX1BDSV9SRU5FU0FTPW0NCkNPTkZJR19VU0JfWEhDSV9QTEFURk9STT1t
DQoNClRoZSBkcml2ZXIgaXNuJ3QgYXV0b2xvYWRlZCwgaSBuZWVkIHRvIHJ1biAibW9kcHJvYmUg
eGhjaS1wbGF0LWhjZCIgDQptYW51YWxseS4NCg0KcGlAcmFzcGJlcnJ5cGk6fiQgbW9kaW5mbyB4
aGNpLXBsYXQtaGNkDQpmaWxlbmFtZTogDQovbGliL21vZHVsZXMvNi42LjAtMDAwMDQtZzBjZGQ0
MzM3YzUyOS9rZXJuZWwvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQtaGNkLmtvDQpsaWNlbnNl
OsKgwqDCoMKgwqDCoMKgIEdQTA0KZGVzY3JpcHRpb246wqDCoMKgIHhIQ0kgUGxhdGZvcm0gSG9z
dCBDb250cm9sbGVyIERyaXZlcg0KYWxpYXM6wqDCoMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtOnho
Y2ktaGNkDQphbGlhczrCoMKgwqDCoMKgwqDCoMKgwqAgb2Y6TipUKkNicmNtLGJjbTc0NDUteGhj
aUMqDQphbGlhczrCoMKgwqDCoMKgwqDCoMKgwqAgb2Y6TipUKkNicmNtLGJjbTc0NDUteGhjaQ0K
YWxpYXM6wqDCoMKgwqDCoMKgwqDCoMKgIG9mOk4qVCpDYnJjbSx4aGNpLWJyY20tdjJDKg0KYWxp
YXM6wqDCoMKgwqDCoMKgwqDCoMKgIG9mOk4qVCpDYnJjbSx4aGNpLWJyY20tdjINCmFsaWFzOsKg
wqDCoMKgwqDCoMKgwqDCoCBvZjpOKlQqQ21hcnZlbGwsYXJtYWRhMzcwMC14aGNpQyoNCmFsaWFz
OsKgwqDCoMKgwqDCoMKgwqDCoCBvZjpOKlQqQ21hcnZlbGwsYXJtYWRhMzcwMC14aGNpDQphbGlh
czrCoMKgwqDCoMKgwqDCoMKgwqAgb2Y6TipUKkNtYXJ2ZWxsLGFybWFkYS0zODAteGhjaUMqDQph
bGlhczrCoMKgwqDCoMKgwqDCoMKgwqAgb2Y6TipUKkNtYXJ2ZWxsLGFybWFkYS0zODAteGhjaQ0K
YWxpYXM6wqDCoMKgwqDCoMKgwqDCoMKgIG9mOk4qVCpDbWFydmVsbCxhcm1hZGEtMzc1LXhoY2lD
Kg0KYWxpYXM6wqDCoMKgwqDCoMKgwqDCoMKgIG9mOk4qVCpDbWFydmVsbCxhcm1hZGEtMzc1LXho
Y2kNCmFsaWFzOsKgwqDCoMKgwqDCoMKgwqDCoCBvZjpOKlQqQ3hoY2ktcGxhdGZvcm1DKg0KYWxp
YXM6wqDCoMKgwqDCoMKgwqDCoMKgIG9mOk4qVCpDeGhjaS1wbGF0Zm9ybQ0KYWxpYXM6wqDCoMKg
wqDCoMKgwqDCoMKgIG9mOk4qVCpDZ2VuZXJpYy14aGNpQyoNCmFsaWFzOsKgwqDCoMKgwqDCoMKg
wqDCoCBvZjpOKlQqQ2dlbmVyaWMteGhjaQ0KYWxpYXM6wqDCoMKgwqDCoMKgwqDCoMKgIGFjcGkq
OlBOUDBEMTA6Kg0KZGVwZW5kczrCoMKgwqDCoMKgwqDCoCB4aGNpLWhjZA0KaW50cmVlOsKgwqDC
oMKgwqDCoMKgwqAgWQ0KbmFtZTrCoMKgwqDCoMKgwqDCoMKgwqDCoCB4aGNpX3BsYXRfaGNkDQp2
ZXJtYWdpYzrCoMKgwqDCoMKgwqAgNi42LjAtMDAwMDQtZzBjZGQ0MzM3YzUyOSBTTVAgcHJlZW1w
dCBtb2RfdW5sb2FkIGFhcmNoNjQNCg0KcGlAcmFzcGJlcnJ5cGk6fiQgbW9kaW5mbyB4aGNpLWhj
ZA0KZmlsZW5hbWU6IA0KL2xpYi9tb2R1bGVzLzYuNi4wLTAwMDA0LWcwY2RkNDMzN2M1Mjkva2Vy
bmVsL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1oY2Qua28NCmxpY2Vuc2U6wqDCoMKgwqDCoMKgwqAg
R1BMDQphdXRob3I6wqDCoMKgwqDCoMKgwqDCoCBTYXJhaCBTaGFycA0KZGVzY3JpcHRpb246wqDC
oMKgICdlWHRlbnNpYmxlJyBIb3N0IENvbnRyb2xsZXIgKHhIQykgRHJpdmVyDQpkZXBlbmRzOg0K
aW50cmVlOsKgwqDCoMKgwqDCoMKgwqAgWQ0KbmFtZTrCoMKgwqDCoMKgwqDCoMKgwqDCoCB4aGNp
X2hjZA0KdmVybWFnaWM6wqDCoMKgwqDCoMKgIDYuNi4wLTAwMDA0LWcwY2RkNDMzN2M1MjkgU01Q
IHByZWVtcHQgbW9kX3VubG9hZCBhYXJjaDY0DQpwYXJtOsKgwqDCoMKgwqDCoMKgwqDCoMKgIGxp
bmtfcXVpcms6RG9uJ3QgY2xlYXIgdGhlIGNoYWluIGJpdCBvbiBhIGxpbmsgVFJCIChpbnQpDQpw
YXJtOsKgwqDCoMKgwqDCoMKgwqDCoMKgIHF1aXJrczpCaXQgZmxhZ3MgZm9yIHF1aXJrcyB0byBi
ZSBlbmFibGVkIGFzIGRlZmF1bHQgDQoodWxsb25nKQ0KDQpIYXMgYW55b25lIGFuIGlkZWEsIHdo
YXQncyB3cm9uZyBoZXJlPw0KDQoNCg==

