Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFAA1D6FE0
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 06:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgEREhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 00:37:14 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:5782 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725280AbgEREhN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 May 2020 00:37:13 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04I4ZFsA023610;
        Sun, 17 May 2020 21:36:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=JQ9D7sXcRtoUd+vdfXnqtR2cy+sUEWqeslt6TGb6lL8=;
 b=oiepEzqsjPdSR8Ohi5QMa3wT4pYQwzWgE4OpupGBnSGAzaIRCEMih01V/344zbV8H1RG
 XLgpLgqdr/RaH0dmR+wCNyV2fQtVAuy92grnLN5MHopFQrEg3VG+2ciSWFnsNevxiZ71
 kDcaiWXUB2pY+Mp9wpXwzRWiiA1TGmocQITeOcuoiObnOg0OBv7L3yDGesQ5in7wG86T
 ihtZ5ma2xP8PEwbLl4oB39CvVvmzJLpzN+/TMUmKbRL4vt011XwMxA3AOIQ17r12i/h+
 MeIV1mn990bYK9m5BGPPI/dXeXB3MHjBcyrzIKMEhtgQcbTtfJPYJ8VITmBPuVftpecr MQ== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2056.outbound.protection.outlook.com [104.47.46.56])
        by mx0b-0014ca01.pphosted.com with ESMTP id 312bs05mkx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 17 May 2020 21:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2ArpD0Uv6RBLhFPaB2Cxvh/8Hp7H+9iciGFEdsNAUmV4jdLzDUOzF2uu8bSUendivordJXLLK+cIBo9HdkaNGiMXT8x9ektWFEpX+TboEpeGXW7snDU1ax7ehKomsA+QD8gZEwd+3XE6eoNvTYZJZhmvkOtMGlmXUi3NpPyIhGmPBJMNf8dRqL3oUYhi3/gmI+c/wKHq9ssxx8e17ffOotx5nZ3RcdmnPMa6AsG391LIjVLm2akr/YC0UxT2y/WwcBFwVVFl9uVL6uUBTXAIu8GNa3umG15ncVdqVDgvOlbFTKjGW34W6MANmcWfgop311/Kdj4ydvlsyoOTdFQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQ9D7sXcRtoUd+vdfXnqtR2cy+sUEWqeslt6TGb6lL8=;
 b=jvRnP7xfiU7okCHhG6hZuCmJU+wQuLwoJ3ulbyAGYm5mVEAh1F3lj2v0YuXrYtA+wPfWZTn6Y9JBxo7WWnNEPk3TsRXSBLYlscvE7zQBd6xryGzbd1io37CJ865nGIFM5CzhlAyiewnJmayi96oZvhfu3QhIt+IRAsW0EiquiADa306go7I2AWh70xk6LBGZX0jYy/72n+ExHD2H+efc5tFSm3+wOogkVIc0o6l+FHeRs+6P75smmML8QmGCb3NL/hT/E7IX+TCFCozt/Fr5uJWLC6qVCmK2E5XKeOBIiLOyHSTiHAi3Wuwz47BI0I0zZncUj8JsNyN5Z5zo8mW90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQ9D7sXcRtoUd+vdfXnqtR2cy+sUEWqeslt6TGb6lL8=;
 b=XXemjYnlQ8j5E3w/CCf2i+H0CC66V0C62xk6U+04UpAsSefHeJvdyHnqxCfp1k/Z2N/I17OpV5JPgE8sUYbMXk5EIoBjJM1T9FSy9WS/uneFiLKZ5iBiSuL8FgR7OgOhSNYHVFmoGnhOCy+rvAWWv4oRMBDLKbKEIofK6QnFVCM=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB5707.namprd07.prod.outlook.com (2603:10b6:5:34::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25; Mon, 18 May 2020 04:36:52 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::f447:6767:a746:9699]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::f447:6767:a746:9699%7]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 04:36:52 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>
CC:     Peter Chen <hzpeterchen@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Topic: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Index: AQHWG8uy7m1dDIVTukqO3oFetRWQJ6iZK+EAgAKs4wCADSf/AIAEVmgAgAAGmRA=
Date:   Mon, 18 May 2020 04:36:51 +0000
Message-ID: <DM6PR07MB5529DFE46AD0CA63C740D39FDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200426130751.32556-1-peter.chen@nxp.com>
 <87368ebz3d.fsf@kernel.org>
 <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
 <87ftc135i3.fsf@kernel.org> <20200518035015.GB27612@b29397-desktop>
In-Reply-To: <20200518035015.GB27612@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMmY3NDM3YjktOThjMS0xMWVhLTg3NjUtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDJmNzQzN2JhLTk4YzEtMTFlYS04NzY1LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iNTA0NyIgdD0iMTMyMzQyNTAyMDkxMTk0ODYzIiBoPSJrYWpocnlVL0I1eEZoRHY0ZnJnQWtXWFV3N0k9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [34.99.247.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0617fa-6904-4bcb-6bd6-08d7fae51606
x-ms-traffictypediagnostic: DM6PR07MB5707:
x-microsoft-antispam-prvs: <DM6PR07MB5707CB875CCFD5C12220398CDDB80@DM6PR07MB5707.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 24NP2bYBa9ZQIq6LK2YI/D7Bu85eBqXQcMagsYnx+ciZhCVBKvU0sgJGnCilStYxKe+xw1p4pQ1FC0e7L1Dw1E3zz4FXW9G0BnY+3lFTSkPA4aoFIpRfdV9R4o4DjJA799Bv8BZT4C0vl74+uNHxOpwWplQ0vSbKI/90ryuwjkKBLcTF8MfpWv06asJWiUBY/VgVWXAz1WiUto8tVxGWBNlQ28D5pBhcN+xFXlEaPd3BgXE19OBIFsjkGqtCc1In5TIwZJHBc+fsajSSkIfKkwPldJK1iKuH20+4BoRZIg+iOIpyLXN6ev+3NZN0V1XJFco5hajhy504PZsGb7r60edcK0TALDaEYvCHzLE818ER61IswmqA4QLq1Fcc5Vf3IEeiVtLn+RuUHPsEgNXrv7ii1El0A4Y4G04VJlzSaGVPMr8KF7yLT6oT/Bnbs6CkFatzWJTILGdV9HMRrx/d+Cm+EHnhtAhKa6LCmjYCPzDE9h1L6GVHFUzhta9dIiwU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(36092001)(316002)(86362001)(186003)(6506007)(26005)(7696005)(5660300002)(110136005)(4326008)(54906003)(8936002)(66946007)(66556008)(64756008)(66476007)(66446008)(2906002)(8676002)(52536014)(33656002)(478600001)(71200400001)(76116006)(9686003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 1qtxidHOeeH2r5TmpgYdFXwwxe0LMaCGHOW7V+g+tzH5TQc2a83160ipL2mPMoE/BndO/3YZ9+BfgdN2zB2B45O2t8zix8QSbAVkgzvp0MzWIlS/DS1Tr+WH5AsLvqpfB8aX40Se5e0DQEz+r555dPT4jGmMMYVNIE9wgI5FRR07O+5G4Qi+j0CgVXt9aA3Ec4sdnL1RBjQI2/lNLAHD0LaXbcZdu4XRLXTMRL0XwYh1lNj/c3TM0Vfq4MpW1aqeKELRJudDYlytCfehd5f5lRPehhPP0lMAtXA6B4q3YAeWabTjApLA7vABVAQGBMeyRDkKnngAvbeonKWXXPcAYjzUzYFtJ+QQHRY8e+/mP/cALTWAgqB2Wff1QPSJMZx4c/r0ESMWdUli/y4NVSFIe/5GgXowCIndeTgZTqeCdQ2bQB58UEwpzfwvFmove2xiAHYPeSB2QTMctksY6JS2M/2NdHT6NsGO2VaolwXEQnE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0617fa-6904-4bcb-6bd6-08d7fae51606
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 04:36:51.9529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hElSv8HDCoR1t85MUgVTMBATO5dV/Kz8GDbMg40gK5Opg7S5AY//fzghTj0NSdFKgxTW1+3fJKah+YFjfP5HENIFH5dkDOX4ctkf3qJEqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5707
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-18_01:2020-05-15,2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 cotscore=-2147483648 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005180042
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Your changes looks like:
-			cdns3_ep0_complete_setup(priv_dev, 0, 1);
-			/**
-			 *  Little delay to give the controller some time
-			 * for sending status stage.
-			 * This time should be less then 3ms.
-			 */
-			mdelay(1);
 			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
 					       USB_CMD_STMODE |
 					       USB_STS_TMODE_SEL(tmode - 1));

I'm not sure whether the first line is necessary in this place  " cdns3_ep0=
_complete_setup(priv_dev, 0, 1);" .=20
Maybe it worked accidentally on my board.=20

I will confirm it with someone from RTL team, but as I remember the status =
stage for Test Mode is=20
send automatically by controller. mdelay(1) was added to give controller so=
me time for sending=20
Status Stage. Status Stage should be send before driver send appropriate Te=
st Mode in
usb_cmd register. If you remove mdelay it can works accidentally on your bo=
ard.=20

Currently I don't have access for testing board so I can't recreate this te=
st again.=20

>
>On 20-05-15 12:35:32, Felipe Balbi wrote:
>>
>> Hi,
>>
>> Peter Chen <hzpeterchen@gmail.com> writes:
>> > It seems the yesterday's reply from nxp email account is blocked by ML=
.
>> > Send it again.
>> >
>> >>
>> >> Peter Chen <peter.chen@nxp.com> writes:
>> >> > Each setup stage will prepare status stage at cdns3_ep0_setup_phase=
,
>> >>
>> >> care to explain this a little better? The controller itself will prod=
uce
>> >> the status stage?
>> >>
>> >
>> > Unlike the other controllers, the CDNS3 does not need to prepare TD
>> > for status stage,
>> > it only needs to write register bits EP_CMD.REQ_CMPL to tell the
>> > controller the request
>> > service is completed, and the controller itself will send ACK answer
>> > for the Status Stage after that.
>> > The code sequence like below:
>> >
>> > cdns3_ep0_setup_phase -> cdns3_ep0_complete_setup ->
>> >             writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
>> >                    &priv_dev->regs->ep_cmd);
>>
>> got it.
>>
>> >> Usually, the way this works is that SETUP stage must be *always*
>> >> prepared by the SW while STATUS stage is prepared on-demand, after we
>> >> get an interrupt from the controller.
>> >>
>> >> Also, I see a possible bug in cdns3_ep0_setup_phase():
>> >>
>> >>         if (result < 0)
>> >>                 cdns3_ep0_complete_setup(priv_dev, 1, 1);
>> >>         else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
>> >>                 cdns3_ep0_complete_setup(priv_dev, 0, 1);
>> >>
>> >> What happens here if result is 0 but ep0_state !=3D CNDS3_STATUS_STAG=
E?
>> >> Seems like you should have a "stall and restart" somewhere here as a
>> >> default fallback.

When this case when happen ?

BTW.  I see one issue in cdns3_ep0_complete_setup.=20

The last one in this function is incorrect:=20
		cdns3_allow_enable_l1(priv_dev, 1);
should be:=20
		/* Resume controller before arming transfer. */
		__cdns3_gadget_wakeup(priv_dev);

Regards,
Pawel,

>> >>
>> >
>> > At cdns3_ep0_setup_phase, the status will be CDNS3_DATA_STAGE
>> > or CDNS3_STATUS_STAGE according to if there is a data stage.
>> > If there is a data stage, it will inform of controller ACKing the stat=
us
>> > stage after data stage has finished, it is at: ep0.c,
>> > cdns3_transfer_completed->cdns3_ep0_complete_setup
>> >
>> > But I don't know why it needs to send ERDY for ep0 transfer without
>> > data stage, but do need for ep0 transfer with data stage. Maybe Pawel
>> > could explain it. At spec, it only says below for ERDY:
>>
>> Would be good, indeed. Pawel?
>>
>
>Pawel seems not at ML about 2-3 months.
>
>> >> Is this backed by documentation or is this something that just happen=
s
>> >> to work? Pawell, can you confirm that this is the correct programming
>> >> model?
>> >>
>> >
>> > No documentation, maybe Pawel could confirm with designer.
>>
>> yeah, Pawel?
>>
>> >> Is this working against USBCV? What about LeCroy's compliance suite?
>> >>
>> >
>> > For NXP USB certification flow:
>> >
>> > The test mode is only used for USB2 electrical test (eg, Eye diagram),
>> > The HSETT tool is used for device mode which will send command
>> > from Windows PC to let device enter test mode.
>> >
>> > USBCV is used to test protocol level, like USB CH9, Mass Storage proto=
col
>> > etc.
>>
>> Entering test modes is part of chapter9 tests, IIRC.
>
>No, test mode is only used for electrical signal test, the communication
>between device and host will be stopped once the controller enters test
>mode.
>
>>
>> > For Lecroy's compliance suite, we usually use it for Link test for
>> > USB3.
>>
>> You need to run the HS compliance suite ;-) USB3 devices must still
>> comply with HS/FS/LS.
>
>No HS compliance suite. Lecroy Compliance Suite are only used for
>link test and PD test. I attached the test items for compliance test.
>
>
>--
>
>Thanks,
>Peter Chen
