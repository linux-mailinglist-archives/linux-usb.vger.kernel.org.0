Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2611D2EED
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 13:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgENL5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 07:57:16 -0400
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:29930
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725955AbgENL5Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 07:57:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQj59VyDKTbHSNa0EgYX2rAPYFG0QKsMOnLh41oqX9Ln8iz/66X5dPg3U76BCREslHc1JNzFxcstodGSQUO2nSyVl3LgFffSbDbo7AAxykMy5lFIx7tcYDGVzaTzLYe4O+/BgT2GV+UKhbYOV05yRpwsraSX2tGteVUxohUXDKyHVz/CtwV+1/xsWwLVwg0me6i/WoflpIw7niEmX/wPhVwqa6I+TMxkFD3+HGjDqeUqimn3NNUucIYRxb226pWcsCPMt1JMtYEtwQTI0uEHYjOQjgpmVRf++zRyfG+/Ba6/JYLe47aPnA8TBcF6Of5heoxQzJeBS2YUKl1WPSeMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNl07ZzdN8RYl3Ly4laGPikQiNIurfUZ9uqhKromvKI=;
 b=lX+VO9aPatIGWw/Zhjk4nMRBVt6SfYx+BRssEN0kzWUlUK9ISj4GwE8YymO8NuO7nSB8ChMSH5+JYpAF+70YWeBDdYjCIBnfA4GvSSS5I2GaQMHISlO9ASwBTdMxH64FZNHeVGkuXwknwYfzSv/16m2RT79VIFPx4Eo8qHjYh1kBMyU7VuMYyZyFevt5asd1m5DNtaXR/qOxt5+3fVDDW6T1XyAUye9IRmBZjOjzSXENle46giaQ1WjXVs72yJlYX8BxV7awPm4+TbHHLwYhkhC9Nav6Q8y453TR9268VyM9pJd6a2cHr9T0betVQlGdWan9wcHzHXwooVI2SMiW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNl07ZzdN8RYl3Ly4laGPikQiNIurfUZ9uqhKromvKI=;
 b=Kwn8U9GCVhozdGia2atGpx0LuqyFkD7DbMc4t2YscpIl5IXe5G2PCVNSlBzRWITahB3KfornSUWoIvyKNqK8Mszr6xQWT9xnOmV8F+H3rhRquZ/3Re4MEtgoPgLHNl6NoLJ8ZlXqCsBs2Xl30ggkJaoH++7ctF9TwxeT398ZB/g=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 11:57:12 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.2979.033; Thu, 14 May 2020
 11:57:12 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] usb: dwc3: allow dual role switch by defautl for new IP
 w/o OTG
Thread-Topic: [PATCH] usb: dwc3: allow dual role switch by defautl for new IP
 w/o OTG
Thread-Index: AQHWKDlH2q4nN+R2S0ic2U9gxE9KOKinap6AgAAPUDA=
Date:   Thu, 14 May 2020 11:57:11 +0000
Message-ID: <VE1PR04MB652871DA81B0C9E0A6DDB4F789BC0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1589272379-30536-1-git-send-email-jun.li@nxp.com>
 <87blmq4wok.fsf@kernel.org>
In-Reply-To: <87blmq4wok.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: de6824ea-ebc8-4913-f95c-08d7f7fdeff3
x-ms-traffictypediagnostic: VE1PR04MB6478:|VE1PR04MB6478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB64789391CC116F1BC8C1ABD189BC0@VE1PR04MB6478.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NlPr+mk8DWs+XeQGbsEw8/V32lAWGuJAZ5JVh81o+X35HUtrmL73kv2CxBa+3f8VH4FwEr+y+iHpe1z7cmPI+2qTIxK0JUyHyKKqhN7kPA1G6EoUMtFYON7tdR6ND9dbE9Zrdcrm8/CZWPrKphCFqRRER4SoMNvwV+MFTWh7d56j6jsKBRB35JA9iHjQd7O5otye5azvE4CjN1yCZ1/8Fogeg2+s7udIucsBIqOAVohqpi56aEB07yQ/CJjBgabvEQH9fTyLQghXhtalioI5g24RiYKwRrbVrX1JKKaLoNsuMGn+jYbSgfQ6OXVXJ5Sprgr9A5SfH49w0iTu3jscyTD6JTZNfsZm5LD6J4iTpfWLTdvWsgoVI4JPuURqA3H3hp9SoOekR7Z4u5UdHr1SlNGygX3y689dGIGVyNpdzNzAqD6zUShfBjoFG5dxksR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(86362001)(44832011)(66446008)(76116006)(4326008)(66476007)(66556008)(71200400001)(186003)(6916009)(6506007)(26005)(53546011)(66946007)(9686003)(7696005)(64756008)(55016002)(5660300002)(8676002)(2906002)(33656002)(52536014)(8936002)(54906003)(478600001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: QZgpfHC1TUw7X/AxyAVokIqTNr9WEghuyznhjiw2zsAUv40+hGSzHava5zseM4BGvewna/JyhDukWTch4J36CS8Mc73bWyU0df6C4iIcSiC3vnRdR+XkreuCjCm0vJa+L0VcWbC2sHPzoNe2qcM+H8hJPOvyiDokNgllSoS7nCR+3Ugf4q50KuGZdfdQISK7Hm8ZVL/1K91H4zDqWtZg8HHG/7q+h/N8KJseJ8XRJT3wsc+CuwBy5j3f3TnE9blNlRWp/NKfqpw4RN5ziDPI+rkdramDFF8+EYzcvGdpuU0W/bNC1Tosa205yEgt2Ub+0BiV0JJcyh0+yEzDWpXKXNdrild1zEVLxuGh851S8hBfuCaW7g39snj/LqRj5eHB4X6k3cNpalJwMGJ6I/9+KSp5KV55LfyXTE1UAx0tYydqHuzUNiNJkY4FqVG2dpugM+mDmFV1QcVNn0XO7uyFEhQAsV1noedaLjLfEG1c6a4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6824ea-ebc8-4913-f95c-08d7f7fdeff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 11:57:11.9785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /n+W3cGY7rauzdDd9uwwpIuMmS99rW6mf0oOgFT4e2FNstUv+sR8LfAl/eDZFLr/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZlbGlwZSBCYWxiaSA8
YmFsYmlmQGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEZlbGlwZSBCYWxiaQ0KPiBTZW50OiAyMDIw
xOo11MIxNMjVIDE4OjUxDQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiBDYzogZ3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IFBldGVy
IENoZW4NCj4gPHBldGVyLmNoZW5AbnhwLmNvbT47IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54
cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogZHdjMzogYWxsb3cgZHVhbCByb2xl
IHN3aXRjaCBieSBkZWZhdXRsIGZvciBuZXcgSVAgdy9vDQo+IE9URw0KPiANCj4gDQo+IEhpLA0K
PiANCj4gTGkgSnVuIDxqdW4ubGlAbnhwLmNvbT4gd3JpdGVzOg0KPiA+IEZvciBuZXcgSVAgdmVy
c2lvbiBEV0MzX1JFVklTSU9OXzMzMEEgb3IgYWJvdmUsIGN1cnJlbnQgY29kZSBvbmx5DQo+ID4g
YWxsb3dzIGR1YWwgcm9sZSBpZiByb2xlLXN3aXRjaCBpcyB1c2VkLCB0aG9zZSBJUCB3L28gT1RH
IG9ubHkgcmVtb3Zlcw0KPiA+IE9URyBibG9jayBidXQgZHVhbCByb2xlIHNob3VsZCBiZSBjYXBh
YmxlIHNvIGRvbid0IGxpbWl0IGR1YWwgcm9sZSwNCj4gPiB1c2VyIG1heSB1c2UgZGVidWdmcyBv
ciBhbnkgb3RoZXIgd2F5IHRvIHN3aXRjaCByb2xlLg0KPiANCj4gdGhlbiB5b3UgbmVlZCB0byBj
b21waWxlIHlvdXIga2VybmVsIHdpdGggc3VwcG9ydCBmb3IgRHVhbCBSb2xlLiBUaGlzIHBhdGNo
IGlzIHRoZQ0KPiB3cm9uZyB3YXkgdG8gZ28uDQoNCkkgYW0gbm90IHN1cmUgSSBjYXRjaCB5b3Vy
IHBvaW50Lg0KRm9yIGR3YzMsIHRoZSBjaGFuZ2UgaW50ZW50aW9uIGlzIHRvIG1ha2UgdGhlIHBv
cnQgdG8gYmUgc3RpbGwgZHVhbCByb2xlKA0KZG9uJ3QgZm9yY2UgZHdjLT5kcl9tb2RlIHRvIGJl
IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwsIGJ1dCBzdGlsbCBrZWVwIGl0DQp0byBiZSBVU0JfRFJf
TU9ERV9PVEcpIGluIHRoaXMgY2FzZS4gc28gbmVlZCBjb21waWxlIHRoZSBrZXJuZWwgd2l0aA0K
Q09ORklHX1VTQl9EV0MzX0RVQUxfUk9MRSBlbmFibGVkIGlzIHJlYXNvbmFibGUuDQoNCkxpIEp1
biANCj4gDQo+IC0tDQo+IGJhbGJpDQo=
