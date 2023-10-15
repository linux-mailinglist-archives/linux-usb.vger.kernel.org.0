Return-Path: <linux-usb+bounces-1633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A877C9929
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 15:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06AC32818DA
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 13:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160E26FC7;
	Sun, 15 Oct 2023 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="U2+mGvWw"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8510F63DA
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 13:37:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20FFA6
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 06:37:21 -0700 (PDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39FDA38l012363;
	Sun, 15 Oct 2023 13:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Vlo/bSUlgEwziOrQMrrb9dFvQK2qTp5yajcCAKhkOeA=; b=
	U2+mGvWw4/eTICcc7XeKVfYHflwmHmIt7grEgrTMTht3Y/x0WAZrALM93J/REELq
	mMQKyzr2TzHlL9YQHLW57mC17WiIsRfDsEhY3VoRXbq/0NYy/90anVLFy0LZJbh8
	7m4Ht/4rn/UwXFdwH2t0OdDsy7xJqF8DuS4ua7PEL3H9LOuATRMe5SpBGKdHa9Iw
	+8utvLTmdQoepgcN/WJL9BYcVvtYa0Zi4N003jdzHvInvQq2zFjMoVCEOsm70QSw
	r0kd3VgvV361vmsfQRktkhgEfSFUM8nk5dB4wam3yJKdQfGQCDaOqDMIufCqVV9Y
	oSBupgvXKKwRRz3pQv0ChQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqhy60yvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Oct 2023 13:37:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULc50Ry80tf7ipDUTvpa2Fo5pHc5EYVX2EMHO4R9/YZOkRZSdM4rMLDREEnZS5beg88g1Gpj1z7qeFizq8bIR5WKJn3XNz2LnCPEXzWmfqaWzunRlEqdgLAYd+MVTKqy9BJqyxKQWFP+BAMlCAjKoJVjS/9axXdzzrboVyH4GK4BpilzIlxT3kvgFBGZV8At7fhFV298r9ELXspwrD8GR7AVe3W+HdJo4PgmALmvVjo+r6UJaSRI/dj451zi5uDx3XzAOOJBR9on4pT2bC5b1qpor2PcRckre5ZsXK4gUA7B3SuMgR+cg3ioguQ0Xs/POJCjW8bVEOpZpkV9GMVPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vlo/bSUlgEwziOrQMrrb9dFvQK2qTp5yajcCAKhkOeA=;
 b=oTAa9PrIeqrSG+eaJMHzAGkbnTnsJEB8MR9bSy+wl+FOwaRXltu3+9dInUTsD4XBP8gVCkbY7BFDs1JMCVDgVy+50ukffmKVP7RBFUrFQ5j/PDcQ8FkPsLHpD83rshLisN/mEda0Pa9fL4Rg01yfRb9DYfDKpk+IWMHLZQK4Fl2gjG3gZ0e1ybaj6LqQY2qWf84cLANKmutPoLC5gu/5nDWgcJNVgLCJo83Feperuk1L4GU5TATFEZncondiiUdUjlGpCxmnClqqNgYqQeEIPGFXQOzX7rxw3MBsq178tBSmQS9EcY4UCUqfN96ugJiC3oRSsu1szRG7MmcksYLxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 13:37:08 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::6eff:bf87:e13f:40df]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::6eff:bf87:e13f:40df%7]) with mapi id 15.20.6863.046; Sun, 15 Oct 2023
 13:37:08 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
        USB
 mailing list <linux-usb@vger.kernel.org>
Subject: RE: USB: add check to detect host controller hardware removal
Thread-Topic: USB: add check to detect host controller hardware removal
Thread-Index: Adn9i9LFJguVckBOQnaI1KZe5N8FAAAbV+4AAFzTXLA=
Date: Sun, 15 Oct 2023 13:37:07 +0000
Message-ID: 
 <PH0PR11MB51914F6E0DAB2A3FEFE58A31F1D0A@PH0PR11MB5191.namprd11.prod.outlook.com>
References: 
 <PH0PR11MB5191464B2F01511D2ADECB3BF1D2A@PH0PR11MB5191.namprd11.prod.outlook.com>
 <9a1074e2-c1ae-485b-b5e7-a34442c98c0b@rowland.harvard.edu>
In-Reply-To: <9a1074e2-c1ae-485b-b5e7-a34442c98c0b@rowland.harvard.edu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5191:EE_|SA1PR11MB5898:EE_
x-ms-office365-filtering-correlation-id: 2861bb72-c2ba-4388-0e70-08dbcd83d394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 855M4bQmtzu0KnZL1K0PTZZQ2h0k1tr/8FV35CNkgQ0U3iU1/ecSzzFEQ2Db08EpHaMy5luHDB5StxFKuG9SM9eU+piPJpZZlgkctPodiR0FBNHX/UHe1U5TJ5jgL6aXUgSsFMhP+S81gOYURdQ0MLSJ1QvaLIwmuDKkj5KSwJjrlnMsX9fzda1MKfZhN+8TLQxRvAIIlRxRPzPz3n5+YgVUCeFFj9QK6sdDFCcm6c8iV/Jm9XCOIAT0kjq1dfCa/sQppP4gdgWmWsKm0tJ5XZ5y+eSy4WHSN2BxqjLevseuUcv4e7Q2KM+Sjx8G02VlHH4EcckkS0hHQSWvTKxK7K45CKTguDf1NWz1qY1QguuSrUgt7g5NNzyti92frwcDZ2HTpY0YOMmIUDH8JcMjABzLOQrl6ScQA9Er6lGxrY45IGH5DYONnlIL2FSsnQGpEYTnShfxnXr0M3JzgP4mbZco1OR4HYaGPENLKLkzJa/C70JcfHgXBJM+zg0hG7l+b01dJpq1l+5OLYm5FvyO81rK5CeJ+CBQ3CxzqagXXJqHC+M2c8YXzQxiIjNSPo3VmxG+z/TXj0kOpep2UO5+m11sVXch/uuGImsC1kEtKpvtR1wKK7QoidJe+3DX34RP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5191.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39830400003)(346002)(136003)(396003)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(55016003)(66899024)(9686003)(38070700005)(26005)(38100700002)(122000001)(478600001)(5660300002)(8936002)(52536014)(8676002)(4326008)(86362001)(33656002)(2906002)(316002)(6916009)(54906003)(64756008)(66446008)(66556008)(41300700001)(66476007)(66946007)(76116006)(71200400001)(53546011)(6506007)(7696005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zbK750hvxzrF5vaMjINWzFgUrRTdNxGseJjw1wat6ngN9kVOE1KcP3X1L5wD?=
 =?us-ascii?Q?HDNPhg0R0QHBzqjYEJqWP8k+7UfBDmCuz1G4ujE0vLmu4GCuOyY/NkH+JNBv?=
 =?us-ascii?Q?7oIP6bX1h7eCoZZdkzV1m6Jkyz6qONMbTPtM0fPj32bjzqe0FcFHZ3eAdUJI?=
 =?us-ascii?Q?Fe/dqnC+madUhdrdX9G3j6FSUTaUByplDL9IOYzQcqUWpBwOgMunNzPgi5/G?=
 =?us-ascii?Q?EM7u2vYpEIrhStyc1ycyYS+02zo6eIcL8feUiHuEKahSJnUvFBTyqKyl+6hM?=
 =?us-ascii?Q?2B8QLsHeOBlsStmhS6C7mGn83OWZcSYXnO4c99KnIcb1bTyj5kmkAKpawoD1?=
 =?us-ascii?Q?/Ll5yM41xGGS8liyUm1SSLKkPc+T1sM6yBU/d4GV9Ui/WceceahlE5jGxi/n?=
 =?us-ascii?Q?kpWlus22ldSH2DFb8OMemYa8nHuvfUoOW8QwOxlDYdGPyM1NVBGRd9vyBfpp?=
 =?us-ascii?Q?WxFyeYWAvgnn5AcACPuYI0lf+ygfxmQ39/S2CBepJVkcddNFUmEDB2HFy+ZI?=
 =?us-ascii?Q?D/7x/wwWaLRlLG5dhJ9HfKTs5TMpXjX7dRV62bMQN+huYHJwNMicUc+atxML?=
 =?us-ascii?Q?XE3PwnwW7EzQlrv6xrCA3NgiAfZgxPGSe5L1kFx3fvmomfLSb0Vi6gP6Onf+?=
 =?us-ascii?Q?UNYGrlfDJL+/7iTgkakpqWNzodVLdyuRhkD+THNfYZ2JiOnxwuQ4y/ZeFppm?=
 =?us-ascii?Q?KrhrvGKDw6gTA/lNf89Kd5IaksVjLzwr9UJbNZu6zIg4zwZH3UpyJywZTpOA?=
 =?us-ascii?Q?ubOf+gz3wpUg6jKuqvNGJSpQtx/Fmw7ocgGw5dvIPrBMxqXry/RvDw3sV/P+?=
 =?us-ascii?Q?AFppmqUy6QeRnsyA6WL8RBtBkcmajQ6Tb0Be0TTBVFoRsb1INShhwBt/0OFK?=
 =?us-ascii?Q?giXBqJyCseWmFoFKySYFYlE63bsq3CZ1aYGhyF85K+q+g9u380aKbq9ZfRBw?=
 =?us-ascii?Q?BTNEyE/Whd7iBKWag3hTJUTMVTCiNyGH3B2QODrXCsC7jcjllpsmtF1Vw4NS?=
 =?us-ascii?Q?z4AnFgr9bnGrKQphQB6qI0QEcm2t5QTC+O+VeTUmVrQRBINBT2CkHYgl7bWi?=
 =?us-ascii?Q?mjIWoHahbt9XVb4s/KWyyUUawNG9EXRI2s9pkjd3KhdlSR5J0MYKjl5t/TDU?=
 =?us-ascii?Q?HrwVe0Q5/sDhDZVtkwt0GHUzb59UK122DC6uL68cli4+uuDsYP9G9IQlEpqf?=
 =?us-ascii?Q?IMGXtAkxmAfsizZ7vL5/uFgU25J2XZXMTtk9AgEDoRIw3zJYb9nOnDPNjPtX?=
 =?us-ascii?Q?iiRkqvr58TC6bGtg+AWcrU3EDshTAB5a0QBU9LZEwECk23odVkT7qBGUm6Qz?=
 =?us-ascii?Q?gL0KB80eSFgNQL6C9OIzv96pnwME9cf+lCxI/zzKvI6JG6GkRFA7hf5S2L6z?=
 =?us-ascii?Q?l17qOeZ5WQgWTBfVsN/xds7dgpWyvSVNbEcbJcp3wmb/+c1lvuUd0X+6hz5r?=
 =?us-ascii?Q?F698fSr+X7/JMysnO2XyRbP92O+zUozg3sLRC1a8l1ndV+MAoM95JrOeFQb0?=
 =?us-ascii?Q?uri/7Kaq1YtnmXIhSto1K5Htrys3S1uu1ULu4vBAbowvUyw3eQBZAmSomnzr?=
 =?us-ascii?Q?h3qi1uLPyFnaVbEjzjgMeeAIvctGy0SNWLcPo+LV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2861bb72-c2ba-4388-0e70-08dbcd83d394
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2023 13:37:07.6703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9NP3qgcHMmPNhuUH65bGZjf1Dfsf+aLXXy4p4hpI7k4rDtDvxe3mMGv6qRdR59U1QmyID1N28TxKBAbehN2Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
X-Proofpoint-ORIG-GUID: EOKsZzLb5Qu-wiKjcICqA_4oc1FAYT3C
X-Proofpoint-GUID: EOKsZzLb5Qu-wiKjcICqA_4oc1FAYT3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-14_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=828 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310150123
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: Saturday, October 14, 2023 1:18 AM
> To: Li, Meng <Meng.Li@windriver.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>; Ingo Molnar
> <mingo@redhat.com>; USB mailing list <linux-usb@vger.kernel.org>
> Subject: Re: USB: add check to detect host controller hardware removal
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> Messages like this should always be sent to the mailing list as well as t=
o me.
> And in this case, since it involves an RT kernel, it should be CC-ed to s=
ome of
> the people involved in developing the RT patches.
>=20
> On Fri, Oct 13, 2023 at 04:25:43AM +0000, Li, Meng wrote:
> > Hi Alan Stern,
> >
> > Sorry for disrupting you very abruptly. I encounter a calltrace when tr=
ying to
> remove a PCIe-to-USB card device with below command. Only occurred in rt
> kernel.
> >
> > # echo 1 > /sys/bus/pci/devices/0001:01:00.0/remove
> >
> > Call trace:
> > dump_backtrace.part.0+0xc8/0xd4
> > show_stack+0x20/0x30
> > dump_stack_lvl+0x6c/0x88
> > dump_stack+0x18/0x34
> > __might_resched+0x160/0x1c0
> > rt_spin_lock+0x38/0xb0
> > xhci_irq+0x44/0x16d0
> > usb_hcd_irq+0x38/0x5c
> > usb_hcd_pci_remove+0x84/0x14c
> > xhci_pci_remove+0x78/0xc0
> > pci_device_remove+0x44/0xcc
> > device_remove+0x54/0x8c
> > device_release_driver_internal+0x1ec/0x260
> > device_release_driver+0x20/0x30
> > pci_stop_bus_device+0x8c/0xcc
> > pci_stop_and_remove_bus_device_locked+0x28/0x44
> > remove_store+0xa0/0xb0
> > dev_attr_store+0x20/0x34
> > sysfs_kf_write+0x4c/0x5c
> > kernfs_fop_write_iter+0x128/0x1f0
> > vfs_write+0x1c0/0x2f0
> > ksys_write+0x78/0x110
> > __arm64_sys_write+0x24/0x30
> > invoke_syscall+0x5c/0x130
> > el0_svc_common.constprop.0+0x4c/0xf4
> > do_el0_svc+0x34/0xc0
> > el0_svc+0x2c/0x84
> > el0t_64_sync_handler+0xf4/0x120
> > el0t_64_sync+0x18c/0x190
> >
> > this trace is caused by below patch that is used to fix a usb hang issu=
e.
> >
> > commit c548795abe0d3520b74e18f23ca0a0d72deddab9
> > Author: Alan Stern
> stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>
> > Date:   Wed Jun 9 17:34:27 2010 -0400
> >
> > USB: add check to detect host controller hardware removal
> >
> >
> > I know it is too too long ago, but could you please try to recall how t=
o
> reproduce the issue that you fixed, how can I produce the usb hang issue.
>=20
> I think the issue could be reproduced just by hot-removing a USB host
> controller.  Maybe the controller was on a PCMCIA card; I don't remember.
> And I don't remember what kind of USB host controller it was.
>=20
> You might be able to find the original bug report in the linux-usb or lin=
ux-usb-
> devel mailing list archives for 2010.
>=20

Thanks for offering this clue about how to reproduce this issue, I will try=
 it on my side.

Thanks,
Limeng=20

> > I want to try whether I can get another method to fix the USB hang issu=
e
> without disable irq, so that avoid the calltrace.
>=20
> For new people, the contents of that commit are:
>=20
>     This patch (as1391) fixes a problem that can occur when USB host
>     controller hardware is hot-unplugged.  If no interrupts are generated
>     by the unplug then the HCD may not realize that the controller is
>     gone, and the subsequent unbind may hang waiting for interrupts that
>     never arrive.
>=20
>     The solution (for PCI-based controllers) is to call the HCD's
>     interrupt handler at the start of usb_hcd_pci_remove().  If the
>     hardware is gone, the handler will realize this when it tries to read
>     the controller's status register.
>=20
>     Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
>=20
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c inde=
x
> 1cf2d1e79a5c..7e2d5271b0c9 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -292,6 +292,14 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>         if (!hcd)
>                 return;
>=20
> +       /* Fake an interrupt request in order to give the driver a chance
> +        * to test whether the controller hardware has been removed (e.g.=
,
> +        * cardbus physical eject).
> +        */
> +       local_irq_disable();
> +       usb_hcd_irq(0, hcd);
> +       local_irq_enable();
> +
>         usb_remove_hcd(hcd);
>         if (hcd->driver->flags & HCD_MEMORY) {
>                 iounmap(hcd->regs);
>=20
> The local_irq_disable() is there so that the irq handler will be invoked =
in the
> state that it expects (i.e., with interrupts disabled).
> Apparently Meng's RT kernel doesn't like it when the handler then calls
> spin_lock(); I don't know why.
>=20
> Alan Stern

