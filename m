Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4ECA36B1D5
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 12:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhDZKsa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 06:48:30 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:18512 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232656AbhDZKs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 06:48:28 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13QAg6mG003697;
        Mon, 26 Apr 2021 03:47:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=P6+5wRqbdpZ/xJcNwBsPWh0ztGcHMo8xol9jYrrNIOQ=;
 b=mZs07xJFYyGe7tSdfkSUTcjGGEmZCxT1yiCpf6pOM953Adwe48nrF8awyU3BHj39/Wvp
 AGlX0VpgI7KdQwK6fCnjcoJO42CnoI7lSFBdyFRiJUiUG9se6OetTKcYsUG6Ob5XUoJK
 LtI8OZTyV8MgDWhx5MyLtBiTZfuXSU0f5qCaTyD+rVJHZ79HajBKC/781zwBRalT0wX1
 ZRrvFfm1useHQEZoeqImJ72Bsom8aIvHbRLxK+fCi0LaWK0L+KRf/n2BVyX74Nxq66OI
 C0orohCHfP/tuJKSelj5UvhWsoFoehLPj4BAQhoBptmQ5FEGq0TkHLfSgg9TjZGbxKs1 yQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
        by mx0a-0014ca01.pphosted.com with ESMTP id 385rnp0kr7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Apr 2021 03:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjcpcfNsmVUjPpjb6UifdgFloHVPkHtJ5HcGE2DhG4K7KUXCida4UWt6U9vDXAXciic2FnEN0CeAI37tF0KJTtvYT6iYTC/G7uO3Q5lgrllrwAcWpLEw/neMG0qXWH7gWnX5ec6S1/c8T+EOZNPzOsuuaBNK6M/jiv+mypfacXMW7M75HYvFLI4e8SVwQ5kpmb7lvWmhiby3O6VtK2aWK8g/vbrfDqTFQx60D/3mXyxX+/iH8HnblqBJBBCPTsJ67tV41Wu7M5e3bOlt43GSsiqelKZVLysteFJ9+LsI7IRhLxoLuKvmdEGqyTBRhWgT7XSXB4sZS5hxzuPQaQhnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6+5wRqbdpZ/xJcNwBsPWh0ztGcHMo8xol9jYrrNIOQ=;
 b=fQiTIs+x6WOJU8GZs8WVZ2ySytyRqASqp+oF/TKxIx9JukmmDa8xvH/iqX99t80N0QY8dBFiOuZyXu8Ui5IUYgrUobQTPjWmeNT+VfWqa63vK/dpOLrqthgb1wgHciVrvPTr9A+Txj2s6/gD1VVjGgHZrdBZuFEUlrE3AJ5+YVl3XJaQJugwKTkGipswJZKodnJpEo9Xldaf+TPlxVWmHvfjEsg+ZqFJ4mpZY2arjHHYaLlXXlH91/dZP55IgIRzKPCgGsfyRDJWHar+QMry7tIciYcKZGmdQmYuHmAFdRG2a+UfRyjwws1uudiu3yIG94wnMXB8IIXktcsixO3Geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6+5wRqbdpZ/xJcNwBsPWh0ztGcHMo8xol9jYrrNIOQ=;
 b=ZkuqLhid7a0WReoQJU18FKHJyCPqzQBG2ClSnERx4FZ9/UBonqbV1+E+flvykbNyXCKuszaxWyPcftpLKJziv+LTPrGvEWXuyHbxz/OINtp9uAUJ8htL0HkRDobNirbQaGVib6scotlVvs53CY39aSV7OnagadBdbKiC7kW1FZw=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BYAPR07MB7847.namprd07.prod.outlook.com (2603:10b6:a03:a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 10:47:32 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 10:47:32 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>
Subject: RE: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before enabling
 it.
Thread-Topic: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
Thread-Index: AQHXOldvFRRdtAIyyk+IaQjTTQ1Uk6rGl1kAgAABrkA=
Date:   Mon, 26 Apr 2021 10:47:32 +0000
Message-ID: <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
 <878s55l50t.fsf@kernel.org>
In-Reply-To: <878s55l50t.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctY2I0ODNkM2YtYTY3Yy0xMWViLTg3OGItMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGNiNDgzZDQwLWE2N2MtMTFlYi04NzhiLTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMzAxNyIgdD0iMTMyNjM5MDc2NDkyNzY1MTU2IiBoPSIwZG1HSVVmOEFCbDhWRlZxbCtsSzRicmwwams9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 092b29b8-8f5b-40b9-2fdd-08d908a0b218
x-ms-traffictypediagnostic: BYAPR07MB7847:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR07MB7847AA71C57568876B232632DD429@BYAPR07MB7847.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oydh6vKzw7ZvmOCbvDKDkY2J2o0TyXRb4ioQfwo9CdYwsORIRp4B88oXBq0G2shVzysnzAAiZglzrm9lD+bQMVU8g6S1ruI4tHEeudkqQRN23nQqOoOc1xcWk0dZN9saMYqaazmDhGplHzuwRHk7W+ZQECLER5rHIUvRzAbFl9jH9lDTAkI/xmc5fJJEtDLh1oUHeDaRV/zBJVgYxHt5epP+zm1SG7l5W9xbZLND0jYYixh5Mkq/jVvlCwcZmkWFZJmtzxZyQ+RM146uZIWQtCK3mzog5aDnMV2QPJEt5yPhlc09BBALSqL0iqog+uujyab81nuj7DMgMhN9ZgsowqHD28rQCLR0/SGvEi+PTrpSg2osQXf8kCJB2GqZtJWKQwEI7XHOgkJQSb+vvPGQCRJGZAzDv64StGt6lPOEwcAuvCwtijTOa1vAoYrXDHOe+jHZbSWOMgu8DC3bAQwfR9k8QXp1WMlSlzhbNQTY7ZLnSZh/X98VcnPcW6MYnsaEn+pmA6CAVbIibfsRG2c3ge5CjE1Nx7lt4XRIXBsqsCT2zG7BtfS0Idi7fq+nFdBFmztY0DBzXT+MGEpJJMQVyizOLcWQOAlHsZK7yX0mraWCYJkEDwm0vYvQg/pyG9qoWzH6a0iGaepROz0DpFVClkJe4tiyY7JWuhGC62bgRSqmisLCmRlz/cJZUxGUWqKIw8kWj2THYTVF8Cf4Mhjg14Y/ru4YVIu0NruZ2SA9UDg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(36092001)(6506007)(54906003)(316002)(55016002)(6916009)(2906002)(8936002)(71200400001)(478600001)(64756008)(9686003)(8676002)(7696005)(66556008)(66446008)(66476007)(66946007)(33656002)(52536014)(38100700002)(76116006)(122000001)(966005)(83380400001)(186003)(4326008)(26005)(5660300002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?o+t0nipNcj5y+N1gpqRSnn0cWV3nsdx6OpGwW9gZBzlDHh289JJyQGXbGTTb?=
 =?us-ascii?Q?W46s6aCRYpwkwHBZgZ/gpypJIFiBECodLvQMiiTz1MjwplKWO8EhPIIgaptk?=
 =?us-ascii?Q?iT8YVPFQ4qd9etl0Hl5HzEcxDBWvpckMBxcDwOzGM2kbA0SL6V+8eNT1bZ2j?=
 =?us-ascii?Q?uTj5OHEP9yOndCm91incHNv++cP/GR/R2mz1h/WyeuG2jMoWG1ltEQwMFzgl?=
 =?us-ascii?Q?TAPmkDpop1g1yAqOD/qyPQo0N0JUGqblBb21bI5XyZU0OVK+RQJRMHO293oo?=
 =?us-ascii?Q?B5Q2VWcm1bCKT20AV5uZ6MKMWlxY3wtxOWuBz9kpAlwzPqNfkz5HtC0K7idg?=
 =?us-ascii?Q?hgWvGBpjn0xm3MdU2n4VGknfK/Qp5dKMVbIa/TuuAFwC4ieFn+steHCSSflb?=
 =?us-ascii?Q?2DJ9VbF3WcgTEKWRgDv+ksBzCmq2MeoMwnZTDDNs52iIC2ccUa4lA81LLl+Q?=
 =?us-ascii?Q?dBuZXPo6fv7fVIQYwRm4YIsNGhh/aNpvAuybGXVbQhSp7oFThueMNAsPghLY?=
 =?us-ascii?Q?5IkOfH7kH3JwmCR/e/3MVlSWXDlyr0kJBzfmZthPMzJUkEz8iIhRden4YHGU?=
 =?us-ascii?Q?E7Uo0H02ea27rlfInioaB+72f7x5xabqHRZn65CTvELwsjc9dOY3C1ggVFoK?=
 =?us-ascii?Q?uRehfNqFr+DGQFNe2mjVNXwZTwA/ReEBB4RdL7lcpfrumT00OwWR2+aMSPpQ?=
 =?us-ascii?Q?uo5dBSILOP0zj81yKU12DWtp84yOhb3VpJrK4RrKt67U6AQd+gY79Kq5IQ+v?=
 =?us-ascii?Q?K5/NPTA0j0SnOb0IJHpNpIK6PBr35xR46R/ox1AU7ODXzj910OV1DxLJwAfg?=
 =?us-ascii?Q?OUumTzw6Iui37xYr+HtMOM8Sip6tlDjD8CvwG8bJkBwbrYjOqy2eesIvz3bI?=
 =?us-ascii?Q?L8SC7/oEIQ/f46AAiistLtu2MWazAbG17I7kHRaXfRz9hOGyS7gabvcKsKar?=
 =?us-ascii?Q?49iHSg6GCidQu2vveSukG6Bh7Op18R7J8s8BJy130ftXFpBZDoCcpi+YYMPT?=
 =?us-ascii?Q?ho7bm0a9Avi70LUYinNiLVXMQMfxT0gmDYImjH2DEGXMuStpx5NgxQPzarK/?=
 =?us-ascii?Q?JhmMPIZZKi3/X+YJPNJhcsRjGQItJnjfNqvbqLSkALLeCicvxoqi3vXq6PjJ?=
 =?us-ascii?Q?tbGeEEj/PdcnZwDLuW2L6Xoh9Zj9AIoUQgQZH4fqm7VDO2OKaxR4Fc4doD1f?=
 =?us-ascii?Q?v26MBQqa+rtk1AMPIlXax9fP3EEJk4onc7dZgJQGzsLqhfeVuHtQGGni3z5p?=
 =?us-ascii?Q?vUQZoDtIRP7DeBvYrAziZgBEuk1zMONHVPblyFwKPTZsME5REaCH+EstaZLD?=
 =?us-ascii?Q?cNRcE8s0tBQiY9+Qi9BUwglj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092b29b8-8f5b-40b9-2fdd-08d908a0b218
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 10:47:32.4015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zwVERv0Ox8punCBe23HclOYQcjNH68wyC6gZig5lT8cj9uBQXXUym+NOaehpG0lLkRh/OyYm1y0VM+OcGQ+9dYQfn388TnTOibnQm35DA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB7847
X-Proofpoint-GUID: lJ9JasZbe1423dw6Vh3lqkkD2E7FBTyu
X-Proofpoint-ORIG-GUID: lJ9JasZbe1423dw6Vh3lqkkD2E7FBTyu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-26_03:2021-04-26,2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104260079
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

>
>Pawel Laszczak <pawell@cadence.com> writes:
>> From: Pawel Laszczak <pawell@cadence.com>
>>
>> Patch adds disabling endpoint before enabling it during changing
>> alternate setting. Lack of this functionality causes that in some
>> cases uac2 queue the same request multiple time.
>> Such situation can occur when host send set interface with
>> alternate setting 1 twice.
>
>Which host is doing that?

I've found out this issue on different scenario, but we can imaging the cas=
e with double alternate setting.

My case looks like:
  - host send Set Alternate Interface (1)
  - device controller doesn't send ACK for SETUP packet=20
  - device delegates request to class and class starts processing it (enabl=
e endpoints, etc.)
  - in the meantime  host re-send the same SETUP packet
  - device controller driver detects this packet and try to finish previous=
 one (according to USB spec), but it  cannot disable enabled endpoints.=20
  - device  delegate the new SETUP packet to uac2 class
  - uac2 again enables endpoint and try to queues again queued requests=20
  - system crash=20
=20
The similar solution exist in f_uvc.c:
https://elixir.bootlin.com/linux/v5.12-rc8/source/drivers/usb/gadget/functi=
on/f_uvc.c#L290

I didn't check the other drivers. Maybe such fix should be added somewhere =
else.

Such issue can be very rare and very hard to debug.
=20
>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>
>> ---
>> Changelog:
>> v2:
>> - moved disabling endpoint into u_audio_start_playback
>>
>>  drivers/usb/gadget/function/u_audio.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/=
function/u_audio.c
>> index 265c4d805f81..c4bbc9decaba 100644
>> --- a/drivers/usb/gadget/function/u_audio.c
>> +++ b/drivers/usb/gadget/function/u_audio.c
>> @@ -401,6 +401,10 @@ int u_audio_start_playback(struct g_audio *audio_de=
v)
>>
>>  	ep =3D audio_dev->in_ep;
>>  	prm =3D &uac->p_prm;
>> +
>> +	if (prm->ep_enabled)
>> +		u_audio_stop_capture(audio_dev);
>
>this looks to be a bug in f_uac2.c::afunc_set_alt(), actually. Note how
>e.g. f_obex.c::obex_set_alt() is implemented:
>
>> } else if (intf =3D=3D obex->data_id) {
>> 	if (alt > 1)
>> 		goto fail;
>>
>> 	if (obex->port.in->enabled) {
>
>if interface is already enabled...
>
>> 		dev_dbg(&cdev->gadget->dev,
>> 			"reset obex ttyGS%d\n", obex->port_num);
>> 		gserial_disconnect(&obex->port);
>
>...disable it first...
>
>> 	}
>>
>> 	if (!obex->port.in->desc || !obex->port.out->desc) {
>> 		dev_dbg(&cdev->gadget->dev,
>> 			"init obex ttyGS%d\n", obex->port_num);
>> 		if (config_ep_by_speed(cdev->gadget, f,
>> 				       obex->port.in) ||
>> 		    config_ep_by_speed(cdev->gadget, f,
>> 				       obex->port.out)) {
>
>...before configuring endpoints again
>


--

Regards
Pawel Laszczak
