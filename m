Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8341D72F4
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 10:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgERIaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 04:30:21 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:51030 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726369AbgERIaV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 May 2020 04:30:21 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04I8TCQf011827;
        Mon, 18 May 2020 01:30:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=NyXYDi97teU+k4ATHfmDt3NO+uNNPY8+NQCTMfYupr4=;
 b=L7OV4MyOqTAKbP7fVr2hjyykzYefrn22kWJ/E95OVA19BMQ4kGswd8A51+OY8HeDewiz
 Q3v2mksQaq0IRhiZsEzHjrO4ZfBmwPF00NiDZ3evDEz9IF1MvaGrG02TTZbb41Z2mV2l
 dkjJqRYlqYwXKtydBGDqUSIoSG7mTbKxR4Lp7KgHhA+CXvy1vBcjts0I5NNdgh5kX+Eh
 mzU1+vGw3S+iThelrCPn2D+znKpukWZqxml9UpUgMu79/ipzkpVnuH3KnYT/hPcCHe9A
 fDuDmU0kvV3n7YqntK+h8fg8llcIVnGHuyI8Z9TCBmn0KXR/uiZNHNmB8sQilk1jPAfo dw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2053.outbound.protection.outlook.com [104.47.36.53])
        by mx0b-0014ca01.pphosted.com with ESMTP id 312bs067b1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 May 2020 01:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+hX3Pb/7SQE5ytfM75QfM+S0MYPs8cRsH436sn0ioxOgg3IaTOZoKpgpbv7JAwytHh3HU8fijstI1WgGocu02BKKhmwKkTh/1RblLBCv71c+9zMuMqyJ7ek3YBxotWv1j48uTRahZEBaxB2xGqeFbBiaYr9PhLzzTONcOfrvygJMr6MPNAjPgICtxziLbAMA1YDxiLq4uctnLhmSwpFPv/hpTr46xLKySPlnLBo49+4FrcsGfEkC+GddvlF0LMRXe+ZbbNjMNqRmBO2m7jlKHTSbEzZqGvgqiOWC+4Jdv6r0eKbfk2gnSGUPuuG7fl1c+BzNVcUNCi5pBgXGryrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyXYDi97teU+k4ATHfmDt3NO+uNNPY8+NQCTMfYupr4=;
 b=V9mFgERSbVe2rM6FtMIKkST5nsygKEkaoU1uyn6+F2IwSHEewMukSUfhdfVL2VpWg79CuqI+rGW5YIhlciyMxy9DyJi+LJIq4Q4L9DS3j25emUeGrExiN2nEgGsyvTEd0/8nbpdkCbG4qeWrs6qaMLSFg8mCGH2jBpwuGThMNDbuKG9xMn4Ew/zO4d8L6NLrjnTK6l3g5MYMbf6zNTM+tsNZRN4vakQ+AfueVyWsMIdAdu2Hmaadq8tfjzdTCvbC3mKTLs0yj8KTsbd+nWztFYH6DW8RIwCNoXZKSiG/1AUmqZl63ffEHyIhbHwTxPlFakOvIS3zt2Gdy9iNudXdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyXYDi97teU+k4ATHfmDt3NO+uNNPY8+NQCTMfYupr4=;
 b=fVx6oI+j2eucg10asehRkgr6tSOJDWvMovIohJ192Vkj2XMCMdrMKM0qkMxUmQ0DqFjzlhDwGyiUcsGVpOKXGbUa45rr0SvI9rVCHGVX0QX8xgXwe+zCNM3UW4uGObozDZlWpqynfX7UxuNxWn21LYJrJUCmPF+LkzOmIV10f2k=
Received: from DM6PR07MB5529.namprd07.prod.outlook.com (2603:10b6:5:7a::30) by
 DM6PR07MB6683.namprd07.prod.outlook.com (2603:10b6:5:1c2::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24; Mon, 18 May 2020 08:30:09 +0000
Received: from DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::f447:6767:a746:9699]) by DM6PR07MB5529.namprd07.prod.outlook.com
 ([fe80::f447:6767:a746:9699%7]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 08:30:08 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Topic: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Index: AQHWG8uy7m1dDIVTukqO3oFetRWQJ6iZK+EAgAKs4wCADSf/AIAEVmgAgAAGmRCAACG5gIAAFEZQ
Date:   Mon, 18 May 2020 08:30:08 +0000
Message-ID: <DM6PR07MB55294A6614050A8B424FD1CBDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
References: <20200426130751.32556-1-peter.chen@nxp.com>
 <87368ebz3d.fsf@kernel.org>
 <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
 <87ftc135i3.fsf@kernel.org> <20200518035015.GB27612@b29397-desktop>
 <DM6PR07MB5529DFE46AD0CA63C740D39FDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
 <20200518061435.GD27612@b29397-desktop>
In-Reply-To: <20200518061435.GD27612@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYzZkNjA4ZDAtOThlMS0xMWVhLTg3NjUtMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGM2ZDYwOGQxLTk4ZTEtMTFlYS04NzY1LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iNDU4OCIgdD0iMTMyMzQyNjQyMDcwMDY4NDAwIiBoPSJCVzE2Z2VCbEVLOWVlUW1xV1JJM2lqQ1VGZG89IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [34.99.247.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d832db0-437d-4b25-3bf9-08d7fb05acd8
x-ms-traffictypediagnostic: DM6PR07MB6683:
x-microsoft-antispam-prvs: <DM6PR07MB6683B51D719DFAB68BDD4345DDB80@DM6PR07MB6683.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JRv4srfAk0UQ4skDdqFf8KqbbtFjWZNxi3bflYvA3Mm6t7UmZi462BPiYlgVSrIDZbXb6+VQa+4BNPPg1BVXdMTkOxEdcXxGd/ryLwPIlNfLbrXzrbhghFGHSNguazSfJT7bY9cXc9bhZQWYLNAEBLthnrPvkhFdtC8uXJYZb8ovfcl+m3nsEiZy54KHYk+UBDveMYcj/Ld0Hsuk0xJ1w0wiYYlAOdKfVhrj5nABZWtq5bkq37UElHHvL8PG4C/I/5Fd+fR8ZlttSQfrLHRedlK092LJ9eGDc/9dKb4TCFrrTHF3yHnWKbWF/DIMtanna3vU5Jgne7txgxF9RZyzeTb7wXCPPvYXzj+PC2imnn/3mCOJzf4QyJv5kpyER+h0jutrffgl7IyEh6Evout5cKqO9M7pyOQ/TzXg86yhU0afLeNg38wuUaZE4Hwkb09hA2ob9zGJvufQk0uzpINcbxLokF3fCqVH0c3hZPseksy682Cwhr6xGp6MQHuwu8Hu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB5529.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(36092001)(26005)(33656002)(316002)(2906002)(54906003)(86362001)(478600001)(71200400001)(55016002)(6916009)(5660300002)(7696005)(186003)(6506007)(66446008)(76116006)(66556008)(66946007)(66476007)(64756008)(8676002)(4326008)(8936002)(52536014)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IRx2kWEoCWv+rxJTDbN3G75iDtpKI7tl526bYehQLbOxXC7H6arwlj5ZqU+s0RlvRF2OvPXxrGuIXQZ5lhkM4THXkVO3TOOHcn/EF+NRamK7x1Kvkz8tJtHYDteEqGG2dm3kFNOSz0hM++FnXvZ83Yw029tuJfnLo/iFOb9J47L+Zg066P7U5YesrSH6gur0XbLftkqcBytR43/f+4i+UBm1sUh4DqsyTfwpVUVvjPZlNF0HW6zSKcOxcc8IA8aPEWRYmscyBchklCkeEA4hE0PhHbN5QxTMGZV+Brb5YlFUuQhPsVhklydWMXIKGoWNTpcxqVdb47nOmbs9egNmvBaViNQXKzWkmqIuELSrYVJSDIx0DT1dECARB4i7hkiwwuimtZN8lzwRCdSqmhEINbav8zczs3VTRJo7vKicTAgBUa0Z85/yOQcal0b6ipuKTz4nG16QelOcqbeTvE45MsyMG3XtazYaLqAg8GsQUHc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d832db0-437d-4b25-3bf9-08d7fb05acd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 08:30:08.8255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8JngDPzYff2HhTPBOW3VoIzWMDpK4ROOle+K7YJmiDnwJmstIn7hACROo0r97DQHp7P0X3PdbvCsstylkgxg1rvGFSKgpT6j+YiLs588U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6683
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-18_03:2020-05-15,2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=904
 cotscore=-2147483648 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005180078
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>On 20-05-18 04:36:51, Pawel Laszczak wrote:
>> Hi,
>>
>> Your changes looks like:
>> -			cdns3_ep0_complete_setup(priv_dev, 0, 1);
>> -			/**
>> -			 *  Little delay to give the controller some time
>> -			 * for sending status stage.
>> -			 * This time should be less then 3ms.
>> -			 */
>> -			mdelay(1);
>>  			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>>  					       USB_CMD_STMODE |
>>  					       USB_STS_TMODE_SEL(tmode - 1));
>>
>> I'm not sure whether the first line is necessary in this place  " cdns3_=
ep0_complete_setup(priv_dev, 0, 1);" .
>> Maybe it worked accidentally on my board.
>>
>> I will confirm it with someone from RTL team, but as I remember the stat=
us stage for Test Mode is
>> send automatically by controller.
>
>Pawel, would you please confirm it with your design team? I tried to
>comment out cdns3_ep0_complete_setup at cdns3_ep0_setup_phase for test
>mode case, the test mode can't work. It means it still needs software
>setting to notify controller to prepare status stage.

Sorry. I got something wrong. You have right.  Driver must prepare Status S=
tage itself.
It's means that origin code is really incorrect and driver sends the second=
 Status Stage twice.

Hardware team confirm also that setting Test Mode in usb_cmd can be done be=
fore=20
sending Status Stage. Test Mode should start automatically after sending St=
atus Stage=20
by controller.=20


>
>> mdelay(1) was added to give controller some time for sending
>> Status Stage. Status Stage should be send before driver send appropriate=
 Test Mode in
>> usb_cmd register. If you remove mdelay it can works accidentally on your=
 board.
>
>If without cdns3_ep0_complete_setup(priv_dev, 0, 1) before mdelay, how
>the controller knows it needs to prepare status stage, the test mode
>setting code is behind than it.
>
>The focus is: my board can't enter test mode if status stage is
>prepared before set test mode, it is strange. At other controller,
>eg, chipidea, we set test mode after receiving the status stage
>completion interrupt, but at cdns3, there is no status stage completion
>interrupt.
>
>>
>> Currently I don't have access for testing board so I can't recreate this=
 test again.
>>
>> >
>> >On 20-05-15 12:35:32, Felipe Balbi wrote:
>> >>
>> >> Hi,
>> >>
>> >> Peter Chen <hzpeterchen@gmail.com> writes:
>> >> > It seems the yesterday's reply from nxp email account is blocked by=
 ML.
>> >> > Send it again.
>> >> >
>> >> >>
>> >> >> Peter Chen <peter.chen@nxp.com> writes:
>> >> >> > Each setup stage will prepare status stage at cdns3_ep0_setup_ph=
ase,
>> >> >>
>> >> >> care to explain this a little better? The controller itself will p=
roduce
>> >> >> the status stage?
>> >> >>
>> >> >
>> >> > Unlike the other controllers, the CDNS3 does not need to prepare TD
>> >> > for status stage,
>> >> > it only needs to write register bits EP_CMD.REQ_CMPL to tell the
>> >> > controller the request
>> >> > service is completed, and the controller itself will send ACK answe=
r
>> >> > for the Status Stage after that.
>> >> > The code sequence like below:
>> >> >
>> >> > cdns3_ep0_setup_phase -> cdns3_ep0_complete_setup ->
>> >> >             writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
>> >> >                    &priv_dev->regs->ep_cmd);
>> >>
>> >> got it.
>> >>
>> >> >> Usually, the way this works is that SETUP stage must be *always*
>> >> >> prepared by the SW while STATUS stage is prepared on-demand, after=
 we
>> >> >> get an interrupt from the controller.
>> >> >>
>> >> >> Also, I see a possible bug in cdns3_ep0_setup_phase():
>> >> >>
>> >> >>         if (result < 0)
>> >> >>                 cdns3_ep0_complete_setup(priv_dev, 1, 1);
>> >> >>         else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
>> >> >>                 cdns3_ep0_complete_setup(priv_dev, 0, 1);
>> >> >>
>> >> >> What happens here if result is 0 but ep0_state !=3D CNDS3_STATUS_S=
TAGE?
>> >> >> Seems like you should have a "stall and restart" somewhere here as=
 a
>> >> >> default fallback.
>>
>> When this case when happen ?
>>
>> BTW.  I see one issue in cdns3_ep0_complete_setup.
>>
>> The last one in this function is incorrect:
>> 		cdns3_allow_enable_l1(priv_dev, 1);
>> should be:
>> 		/* Resume controller before arming transfer. */
>> 		__cdns3_gadget_wakeup(priv_dev);
>>
>
>Would you please send a patch to fix it?
>
>Peter
>
>--
>
>Thanks,
>Peter Chen

Pawel
