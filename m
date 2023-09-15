Return-Path: <linux-usb+bounces-187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3177A2B12
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59402821DA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887341BDDE;
	Fri, 15 Sep 2023 23:47:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DCB18E1B
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:47:30 +0000 (UTC)
Received: from us-smtp-delivery-131.mimecast.com (us-smtp-delivery-131.mimecast.com [170.10.129.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22AFF2102
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 16:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clinicomp.com;
	s=mimecast20211203; t=1694821647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDb/vo0+K/9CIEgpFtMkO4id5NVV2SR5rnsWQX7++u0=;
	b=fIXKMlgeF9TOfbW3wDQI2J3Lx5gRJpujcTdCPWWp9J3vNFvqEx2+eJAiDXAxwLegfzApU4
	UAD28VcD2uyAnRl7EcsluaaWZDbOp5wKXkmvz27ldp2ifJLUFdDfE2t7gFJSAAdMC3gs4U
	Y58bb73TUkwRJziTrtCZxGCEI6NYY30=
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-5xQJd6-cNwGx2s1vP2-4sQ-1; Fri, 15 Sep 2023 19:47:26 -0400
X-MC-Unique: 5xQJd6-cNwGx2s1vP2-4sQ-1
Received: from CO6PR11MB5572.namprd11.prod.outlook.com (2603:10b6:303:13c::20)
 by DS7PR11MB7784.namprd11.prod.outlook.com (2603:10b6:8:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 23:47:23 +0000
Received: from CO6PR11MB5572.namprd11.prod.outlook.com
 ([fe80::c414:ebb3:cdcf:5f2f]) by CO6PR11MB5572.namprd11.prod.outlook.com
 ([fe80::c414:ebb3:cdcf:5f2f%4]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 23:47:23 +0000
From: Steven Turgetto <Steven.Turgetto@clinicomp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Donny Callego <Donny.Callego@clinicomp.com>, Jeremy Simmons
	<jeremy.simmons@clinicomp.com>
Subject: Update needed for pl2303 module (resending in plain text)
Thread-Topic: Update needed for pl2303 module (resending in plain text)
Thread-Index: AQHZ6C75ZZdP35BeFEKOfRbCXhdYiQ==
Date: Fri, 15 Sep 2023 23:47:23 +0000
Message-ID: <CO6PR11MB5572CB5C140AD3B9C67DEE0CEAF6A@CO6PR11MB5572.namprd11.prod.outlook.com>
References: <CO6PR11MB55720CC876178BBA0EB970FAEAF6A@CO6PR11MB5572.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB55720CC876178BBA0EB970FAEAF6A@CO6PR11MB5572.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5572:EE_|DS7PR11MB7784:EE_
x-ms-office365-filtering-correlation-id: 8a3c2293-93b6-42fa-6367-08dbb6461bc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Hxxhm5ZYoHbh5PI3VtYh25mnpRIL/VH5dWGcxBVVQaLIMHlHBQw0S6TYM3ZSa+ckc2+QModELzEd3/BoymIs2mGWcfm5Ohdq+uSFnXopqBbwACB3SwYvEFjLEIXyHk5gNPdvzCIaGjhw2Du1ZZ9O63kPz/TIHG97K4IXYAOsk14GOgwgLzvoOCW3e9DQq/96dLgq0HvINs2JY7nbl0B4o9MzwE3RJg+J1FF1843scauGpE1HBFBUblwVG9TxP8fhxqQ17nToUwbV6xu3kk3PRaPChMoZ6qrT5Tx7OzNlUryFEpirbj90+Sxbgg+7bP3zVvbNfvKF5DGOO7Zaiuasy08F1O5I9k9ln+4WnvO7Tgw1cQBneCoaHVsjxNoi87hfXW9Osb40LESXTocflILnd+6DKpLgJA3+GCHsAR+ki/fIc5m2ugwQXGQf+uldQwUPJXkZGAkI5L1XVEB5ENWYKQDUUF4v66gblLOId1b5odnnw14AVoD5biTUwXpjhKA0rOuJbTb5gAzCPA6QXJhFPDdZmx9JMwrWZNVvhuCwKikwUtjxg5jWvUTSnZI5rnvD2BGfDWfN6Ap/tzlZE/QLZ+fVQj8LP7hsYPtiPH+RoWs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5572.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(396003)(376002)(346002)(136003)(186009)(451199024)(1800799009)(38070700005)(40140700001)(38100700002)(33656002)(86362001)(55016003)(26005)(966005)(478600001)(5660300002)(41300700001)(66476007)(52536014)(55236004)(8936002)(316002)(66556008)(76116006)(54906003)(66446008)(6916009)(64756008)(66946007)(107886003)(7696005)(9686003)(2940100002)(8676002)(71200400001)(4326008)(2906002)(122000001)(6506007)(83380400001)(15650500001)(4744005);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4kyd3WqTJ/HNbAe71HjMY8Ow9d/n8DIn+HKafhI+B3qTx3Z3sV5HuadXFc?=
 =?iso-8859-1?Q?2SJMen7qaMwV2rF7eBKBGwVFGdeTrEeujWr8rpfihSopRspYq9IouLeygw?=
 =?iso-8859-1?Q?f++T0uBHYFuBjpmvCFZVpsGvshLdETbBGiCH565zyHF3Ay5qCn7hE6CHTK?=
 =?iso-8859-1?Q?7tXdI6f50pJWJBNdQjxCiMO6lEPOayV+j2iJtTC4bzbRIvTEsBmixAu2N/?=
 =?iso-8859-1?Q?g3jXXZCFqZIM/NbUxe7vDh0u9FEgCCO5Po7nHprUrQCEz+JMdgsWtPocQO?=
 =?iso-8859-1?Q?RbflhxGGKkeGiS6DPdVyXrMPL3xojV0A5jvx/QyveziVW+eoopBWTMn8E7?=
 =?iso-8859-1?Q?7Ou94dAJ3sI+GtniURKT756xv53ozsC7g9v+XZyTYS4wM6/qmdK9YpeJ4E?=
 =?iso-8859-1?Q?VN8PLulxaLA1BYJGVSRCnjOwtf2hOdkem/NMsbAGkS1mq2TUbBbVHPx+Zt?=
 =?iso-8859-1?Q?8DIXOVtpZqniWmrYr4UVKObbjmTPvygLUOsfa5VCKe71k+gylVfmCl8Hpj?=
 =?iso-8859-1?Q?QFVLjHaNciz9hqXl04wXlsgZlJrPBdfZ+VpjHwkhDd9rc0xsa+pK22qAYI?=
 =?iso-8859-1?Q?iGvfBsDJFP0JZ8IO6ciywVFDsVMmZDd/y4/a0w/DjMyTEdlGpIwt151DHX?=
 =?iso-8859-1?Q?6wbWQ8tjQ51yDjUjHlU/akUDbhzZsHLM673koNMynQ669LjD2RKkGkXtF+?=
 =?iso-8859-1?Q?ikPJlZII4JnOtO0Re6Ro+OwegJFxgXRdkacGzF3uHrTEnqmXj+UPChmkID?=
 =?iso-8859-1?Q?SSEx8tjwKZRTA374XI85l2AVXTmuC323zUdwAJ84EU91XtoDSlV0c1fToo?=
 =?iso-8859-1?Q?5LwDbqBNaL6ijc56Y3X4iNxOXQDgSEQmovpAakIeSlzF6P6KxJ/NWklthm?=
 =?iso-8859-1?Q?Xyxs5SvDkl3bgkONeGy9MoRW+8vxbxPTBzBRkkWE/uyVglQpnDa4xhX09z?=
 =?iso-8859-1?Q?ANyC3Hq5a5Z5LiPFZySS5QekRJomgrSh94IqjGMoKlWhz/HET26cnMBExO?=
 =?iso-8859-1?Q?OnF75kNBsrvQcfkdhvGDaDzSAHxl0HuMRPHaZxjoXDIX7mw/qIeniQnf0/?=
 =?iso-8859-1?Q?On4ykcLMRxggWsj+8yRd4azwzSbDJWJEY7/P348yHsFPCvPhYAQV8ltuDL?=
 =?iso-8859-1?Q?XkKsL+nLLS2tOJtXEY0ncWdoMsxdBpq4K9fO2Oc834oyoUeG32FOtjoWVF?=
 =?iso-8859-1?Q?WwPL9bKLhkCJTsfVkGJJsoNAl/QxOFf3/DDtMq1PqM8xAZ+F11DY6wVBQD?=
 =?iso-8859-1?Q?5iSFY4tygkokg79AQsaCaX4gBDiarWhnRw6rsM4gpN2ktLmkUwnU6JE/hI?=
 =?iso-8859-1?Q?xSKX2DaUwD1xb1WHPnciJxKhpeqXKS7Ds83xufYbRGgaFOuYyYnYt/zqmx?=
 =?iso-8859-1?Q?9Yj/e2gqlv00IDlHevCQorFAyf+bXBLZc/MOgcvA105+jq0DpJuDA+rHwt?=
 =?iso-8859-1?Q?POaJPqQLyvWqoKnU/TOf8iAtu3vBGx6scDifctcddCSt9pfR1kpl4r5XGY?=
 =?iso-8859-1?Q?6PRKD073Dq/AeQzbZPWjoh2c6NrMXSXst7WCbbVNsvGv7mxgdxaYFOAXY0?=
 =?iso-8859-1?Q?655swELaYJxFj6+IUjCu4hYw0z70Z1Rl0RNp172KaPXCHImEVo7FSC+avo?=
 =?iso-8859-1?Q?R4EIOTMtNasGHwVf3mRqKuJauhi0hcidau?=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: clinicomp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5572.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3c2293-93b6-42fa-6367-08dbb6461bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 23:47:23.2804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7dad2a30-43e0-402b-937d-5cb126977163
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtQXoXgUExcu2X9KA0mDAIFKD4+rknjKF1Lgsye5Tg3SFsA7FfxcKYPtMzqRh77T7k1olJBk3KWdHOczAGDx2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7784
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: clinicomp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

CliniComp has a device which reports bcdUSB=3D0x200 and bcdDevice=3D0x400. =
This configuration is necessary for our product to support some legacy hard=
ware.=20

In the pl2303 driver included with the RedHat Enterprise Linux kernel 4.18.=
0-477.10.1.el8_8.x86_64 , we added the following two lines to pl2303_detect=
_type function at line 449.
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 case 0x400:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n TYPE_HX;

Would you please let me know if you are able to support our device in the p=
l2303 driver?

Regards,
Steven Turgetto


Steven Turgetto
Sr. Embedded Software Enginner
=A0
mailto:steven.turgetto@clinicomp.com
+1 [858] 775 8194
9655 Towne Centre Drive
San Diego, CA 92121
https://www.clinicomp.com/

This message is for the designated recipient only and may contain privilege=
d, proprietary, or otherwise private information.=A0 If you are not the int=
ended recipient, please notify the sender immediately by reply email and de=
lete this message.=A0 Any other use by you of this email or the information=
 contained therein is strictly prohibited.


