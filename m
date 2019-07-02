Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6385C6D8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 03:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfGBB6t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 21:58:49 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:35290 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726781AbfGBB6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 21:58:49 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ECB47C01C9;
        Tue,  2 Jul 2019 01:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562032728; bh=ov8WcVSwcgAmTu0Icsmn/YP2Ioh259eIVruoSrHcRgo=;
        h=From:To:CC:Subject:Date:References:From;
        b=ba/CaXdY4kKNNmsndVjWe2ASDrElaTDrKliJzd8EXBDFccQqm4xABN9ajjk/HZTtm
         7ZpWEUN+H79vF47JhQK61ESykimWz1Ea57ef39jqpiMHWBFHwNQdWbtaJZixJeoTie
         vRFnDcYt6uQ19tc1+/ksdUQFAnj+JoO3sOq1So4nBpq6eRCrLwEtORl1nyu4Gu8UkW
         FMlJheXgpV4D3MtO0tCQvLsGxBJ3AOaTJ87E+93FrWU/S9+3mDv5QZXZOqPFcC1rvn
         2OiJGPfIg6jGAuSJbMjQ3f1iDPHF7Jwviu33j+i2TDd1AiL8HMVX2Ro1zxizXNS1xL
         UialKlb+WS1YQ==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C1E44A023B;
        Tue,  2 Jul 2019 01:58:47 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Jul 2019 18:58:47 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 1 Jul 2019 18:58:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeZ2kiRMcLQ3xa5PM+unJ/fhvfUWgvLpEbhXu69VlMk=;
 b=nOL7apDc5/NzwkT4bDvY/+WvuJFhcJhZN4tNBKpAKwpcf7z42goH86qOhzEYy/FKrfONpT6GeY8e8MVhL2Q82is+HAAahw/AMA9B+zW71XHLOovOwEwZfaaGTyuKG6kGr7hRDMTXutJRUHDuzTWVCcoMeK/fqAbLfXAl4TFwBvU=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB2535.namprd12.prod.outlook.com (10.172.121.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 01:58:45 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3%6]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 01:58:45 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>, EJ Hsu <ejh@nvidia.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Topic: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBx/hjwLl90oF1Ui1cduuEUYtTw==
Date:   Tue, 2 Jul 2019 01:58:45 +0000
Message-ID: <CY4PR1201MB003732F412EFABD4046D7FD4AAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.1905101023400.1516-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b77941b-9d87-4411-9ce4-08d6fe90d12e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB2535;
x-ms-traffictypediagnostic: CY4PR1201MB2535:
x-microsoft-antispam-prvs: <CY4PR1201MB253534F9339C03C73F3FB28CAAF80@CY4PR1201MB2535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(346002)(396003)(39850400004)(376002)(189003)(199004)(486006)(14444005)(68736007)(6506007)(186003)(256004)(26005)(86362001)(25786009)(102836004)(7696005)(76176011)(476003)(6246003)(2171002)(15650500001)(14454004)(3846002)(81166006)(8676002)(74316002)(8936002)(81156014)(305945005)(7736002)(446003)(2906002)(6116002)(52536014)(33656002)(229853002)(110136005)(4326008)(66476007)(66556008)(66946007)(64756008)(76116006)(55016002)(6436002)(54906003)(66066001)(53936002)(73956011)(71200400001)(66446008)(316002)(91956017)(71190400001)(9686003)(5660300002)(478600001)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB2535;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VbJ1g8VTnCCZvgwELfhVCXPGmGPyTIhUQZVIMs7ylwPf50/qJT/d55X3LWF1JE4xyfcmCs0OTRlHisRnhSbYNXyJpbw7pqZMrq8D47NkyROum6G4wVq6LS2whUk6Y/Fw6XDIJeOtpaTpNIHScxhTanQ5hsG6IOuNI94/fQREz/Yn7mG5KtzkvmAXGecj9lNEZ5v4C920lsnW1C2WsUnXDq7lCPdcwo7i1pGbysqXPoLlF1UzREhu04pv20JoqIJx9lstf7DVc0Q5n/HHqvBevkyoourdYTuosillKZIOSBjFTqWdkoLZxa0ltOvaaK0NmjE/dAUvuZ1VOQICT6grrXOPchBk+7XmstMU6BNTddgLFDRE/ro2HkmBivVKaSIM3H11IyKWOuVtcNJbIhvXAj50gUuetWhir3x7nxXTmro=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b77941b-9d87-4411-9ce4-08d6fe90d12e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 01:58:45.6001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thinhn@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2535
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
Alan Stern wrote:=0A=
> On Fri, 10 May 2019, EJ Hsu wrote:=0A=
>=0A=
>> This change is to fix below warning message in following scenario:=0A=
>> usb_composite_setup_continue: Unexpected call=0A=
>>=0A=
>> When system tried to enter suspend, the fsg_disable() will be called to=
=0A=
>> disable fsg driver and send a signal to fsg_main_thread. However, at=0A=
>> this point, the fsg_main_thread has already been frozen and can not=0A=
>> respond to this signal. So, this signal will be pended until=0A=
>> fsg_main_thread wakes up.=0A=
>>=0A=
>> Once system resumes from suspend, fsg_main_thread will detect a signal=
=0A=
>> pended and do some corresponding action (in handle_exception()). Then,=
=0A=
>> host will send some setup requests (get descriptor, set configuration...=
)=0A=
>> to UDC driver trying to enumerate this device. During the handling of "s=
et=0A=
>> configuration" request, it will try to sync up with fsg_main_thread by=
=0A=
>> sending a signal (which is the same as the signal sent by fsg_disable)=
=0A=
>> to it. In a similar manner, once the fsg_main_thread receives this=0A=
>> signal, it will call handle_exception() to handle the request.=0A=
>>=0A=
>> However, if the fsg_main_thread wakes up from suspend a little late and=
=0A=
>> "set configuration" request from Host arrives a little earlier,=0A=
>> fsg_main_thread might come across the request from "set configuration"=
=0A=
>> when it handles the signal from fsg_disable(). In this case, it will=0A=
>> handle this request as well. So, when fsg_main_thread tries to handle=0A=
>> the signal sent from "set configuration" later, there will nothing left=
=0A=
>> to do and warning message "Unexpected call" is printed.=0A=
>>=0A=
>> Signed-off-by: EJ Hsu <ejh@nvidia.com>=0A=
>> ---=0A=
>> v2: remove the copyright info=0A=
>> v3: change fsg_unbind() to use FSG_STATE_DISCONNECT=0A=
>> ---=0A=
>>  drivers/usb/gadget/function/f_mass_storage.c | 21 +++++++++++++++------=
=0A=
>>  drivers/usb/gadget/function/storage_common.h |  1 +=0A=
>>  2 files changed, 16 insertions(+), 6 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/=
gadget/function/f_mass_storage.c=0A=
>> index 043f97a..982c3e8 100644=0A=
>> --- a/drivers/usb/gadget/function/f_mass_storage.c=0A=
>> +++ b/drivers/usb/gadget/function/f_mass_storage.c=0A=
>> @@ -2293,8 +2293,7 @@ static int fsg_set_alt(struct usb_function *f, uns=
igned intf, unsigned alt)=0A=
>>  static void fsg_disable(struct usb_function *f)=0A=
>>  {=0A=
>>  	struct fsg_dev *fsg =3D fsg_from_func(f);=0A=
>> -	fsg->common->new_fsg =3D NULL;=0A=
>> -	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);=0A=
>> +	raise_exception(fsg->common, FSG_STATE_DISCONNECT);=0A=
>>  }=0A=
>>  =0A=
>>  =0A=
>> @@ -2307,6 +2306,7 @@ static void handle_exception(struct fsg_common *co=
mmon)=0A=
>>  	enum fsg_state		old_state;=0A=
>>  	struct fsg_lun		*curlun;=0A=
>>  	unsigned int		exception_req_tag;=0A=
>> +	struct fsg_dev		*fsg;=0A=
>>  =0A=
>>  	/*=0A=
>>  	 * Clear the existing signals.  Anything but SIGUSR1 is converted=0A=
>> @@ -2413,9 +2413,19 @@ static void handle_exception(struct fsg_common *c=
ommon)=0A=
>>  		break;=0A=
>>  =0A=
>>  	case FSG_STATE_CONFIG_CHANGE:=0A=
>> -		do_set_interface(common, common->new_fsg);=0A=
>> -		if (common->new_fsg)=0A=
>> +		fsg =3D common->new_fsg;=0A=
>> +		/*=0A=
>> +		 * Add a check here to double confirm if a disconnect event=0A=
>> +		 * occurs and common->new_fsg has been cleared.=0A=
>> +		 */=0A=
>> +		if (fsg) {=0A=
>> +			do_set_interface(common, fsg);=0A=
>>  			usb_composite_setup_continue(common->cdev);=0A=
>> +		}=0A=
>> +		break;=0A=
>> +=0A=
>> +	case FSG_STATE_DISCONNECT:=0A=
>> +		do_set_interface(common, NULL);=0A=
>>  		break;=0A=
>>  =0A=
>>  	case FSG_STATE_EXIT:=0A=
>> @@ -2989,8 +2999,7 @@ static void fsg_unbind(struct usb_configuration *c=
, struct usb_function *f)=0A=
>>  =0A=
>>  	DBG(fsg, "unbind\n");=0A=
>>  	if (fsg->common->fsg =3D=3D fsg) {=0A=
>> -		fsg->common->new_fsg =3D NULL;=0A=
>> -		raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);=0A=
>> +		raise_exception(fsg->common, FSG_STATE_DISCONNECT);=0A=
>>  		/* FIXME: make interruptible or killable somehow? */=0A=
>>  		wait_event(common->fsg_wait, common->fsg !=3D fsg);=0A=
>>  	}=0A=
>> diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/=
gadget/function/storage_common.h=0A=
>> index e5e3a25..12687f7 100644=0A=
>> --- a/drivers/usb/gadget/function/storage_common.h=0A=
>> +++ b/drivers/usb/gadget/function/storage_common.h=0A=
>> @@ -161,6 +161,7 @@ enum fsg_state {=0A=
>>  	FSG_STATE_ABORT_BULK_OUT,=0A=
>>  	FSG_STATE_PROTOCOL_RESET,=0A=
>>  	FSG_STATE_CONFIG_CHANGE,=0A=
>> +	FSG_STATE_DISCONNECT,=0A=
>>  	FSG_STATE_EXIT,=0A=
>>  	FSG_STATE_TERMINATED=0A=
>>  };=0A=
> Acked-by: Alan Stern <stern@rowland.harvard.edu>=0A=
>=0A=
> Although at this point the comment you have added to the CONFIG_CHANGE=0A=
> case and the following test are useless.  Since common->new_fsg doesn't=
=0A=
> get cleared any more, it will never be NULL at this point.=0A=
>=0A=
> What really matters is that the FSG_STATE_DISCONNECT case doesn't call=0A=
> usb_composite_setup_continue().=0A=
>=0A=
> Alan Stern=0A=
=0A=
This patch causes a failure in USB CV TD 9.13 Set Configuration Test.=0A=
Please review and help resolve it.=0A=
Apologize for the short report description. I'll try to capture more=0A=
info if you cannot reproduce it.=0A=
=0A=
Thanks,=0A=
Thinh=0A=
=0A=
=0A=
