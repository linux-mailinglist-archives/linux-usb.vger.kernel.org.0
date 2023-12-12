Return-Path: <linux-usb+bounces-4005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B16FC80E201
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 03:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46DE1C21716
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 02:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83D6441A;
	Tue, 12 Dec 2023 02:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iVo3n30r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HXCevYpB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A02B95
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 18:43:06 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BBM3KMK005527;
	Tue, 12 Dec 2023 02:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-11-20;
 bh=rM+SFJ/ZYfFRkN2Q/x3/d8sszIHU4xSkftmL4X11tlo=;
 b=iVo3n30rDSHWFq8tWPIYzl24yrNknvXDzsstDiwdJA0NS33a8AkmTPyxLP/sEnwfrlsX
 VG/8a8+Z2V7M5HFQFKxLpvLE5NDrVYMZwizEdOZ8Xs8+Vn7nSv9xTr4Gd78sxnMkfNrH
 umdMIQcuTiEMzQ5gXn2gcm4fUp+V0T/hnRhP2e8hNIxqgaLchMGs4pHWHSn5WKkVQDSJ
 bEwCe5s+Uygy7JF4LPwTQWrGLHi6iHmc5KM5qq6ADjgrWosR806+oC3Izikdf/Pr5saP
 pfnHbOXtng8lA1tm0+CckVS0YpYRE2CM0ZDf7cSdxP5XqnfP1BNb0+wpn/VDhO2+HBbY cg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3uwgn3jtw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Dec 2023 02:42:52 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3BC2Vwhc012976;
	Tue, 12 Dec 2023 02:42:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uvepc5f8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Dec 2023 02:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap8BdyUQXWdjFjrMcp1wDiVfjnLPYVXxO6JEjUfV+yKv/1DrYvZ+MYBT0kaUdZKT6UJDenBQJgbcIyeGxHAmPXUw7/J3ODDhagSqoizjKENjhvft6KgGqGYFHq7ry+H3ZxgnYDBZCLuz4WVTDVGNQus0kq5LWeh9JB87LC6SUxqJlE+wDte/bAkfIx/I14f85q0E/KsWNoyH05nRAv7/ZKivH0kra5uAKQdy7iwgB0cBs6nCpK0nO8wGkGr4Bx2NKOfBdtdPnEnkAAKdJsrg+vvHKQOXqg+G33prt60w2YE2B0eG5lUGqA5PrIW0NLl35KZ9Oye56H+XzYl1WL+QBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM+SFJ/ZYfFRkN2Q/x3/d8sszIHU4xSkftmL4X11tlo=;
 b=IQew4WeqThoQ3ZWRHdL6coEp15Iocd5GxR07tQZEJEMLTPOA3tJvYkKBukP5cT6i3SyL8EDUnwCwkvW2u1B61sVbCcg1X/jqV9N9gxud/JBjYZ0TO/XO46nS2wViLoB6XL9YgKCprlVuWdpQml9kmKqrehH3t4Y3t7lmgc10fSnPBpdGQ0nThbNvAlkkbSn9eGCYGO2RY9RDlDao7CLb5d0mFRy539lA2wyHwt8FceDNBnAAegl/DnmKj/G/UtIaB3sRlNeK9z9gwfzvfKRfIAQpY6BBhGlL1PJvl85E4jzSzq4UTSLZYOgpRSt8Lqfhtw2WznTAW2tv/X+G9rOcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM+SFJ/ZYfFRkN2Q/x3/d8sszIHU4xSkftmL4X11tlo=;
 b=HXCevYpBLL9aPSnIhOc2aQ7CmTFJ4fxl8SSCvwa1dzQhhCP9TGCgK356o+0yewwzbfvebf5y4UHFyxDpT9GUEV7Num3U3rVgjmznzWgR6UIBK0PfOSIUpMmqypqroIV+gMJ1VrfKfW1cBQ5lY051l19Kr1gQ7OVeo6mjbzGB/tk=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA3PR10MB7072.namprd10.prod.outlook.com (2603:10b6:806:31d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 02:42:50 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972%3]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 02:42:50 +0000
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb-storage: Add quirk for incorrect WP on Kingston DT
 Ultimate 3.0 G3
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zfygi1qc.fsf@ca-mkp.ca.oracle.com>
References: <20231207134441.298131-1-tasos@tasossah.com>
	<yq1zfykk3rx.fsf@ca-mkp.ca.oracle.com>
	<635ee884-5783-477f-b170-4034344dc7ef@tasossah.com>
Date: Mon, 11 Dec 2023 21:42:47 -0500
In-Reply-To: <635ee884-5783-477f-b170-4034344dc7ef@tasossah.com> (Tasos
	Sahanidis's message of "Mon, 11 Dec 2023 03:47:50 +0200")
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SA3PR10MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b681ea-4e27-4ac2-f2db-08dbfabc07fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9FNfvTZncd51IFTHeGzoYfVX1QL1fkcFH70qwyYzVWVxf70ddexitWCR/M3HfB90MUHPUP/q99tL20VvKq8wdmNxUnh5Ozk2rUl4DviZp+S8rhEBNHsN43foc+r2VciVFdEFlj1vkOm5WTGQB3PTaOrZi9LrjstEZCaXRJtFkS+NFXAAU/4PRoJIs3GH9ckZOZgRSuMr6EI6s6tFsbiWORgbqdyJG+C7/27DMMmpP6b/0rZhzz2VY6dIoLthCqcP9houzOEOKveVzMizFogsn6BkPpxvQwv6r+KCTv4sYWiEJYbBA3l3oe7xpYXpNbaQ19rVT9wNR6uYSoZoF1hHomVPo/FziXNLtwmYVlUpn78Mjisbe0joysxmDQMj0AXwAv2TyzZo0D0PyCcIBIc2Rw9126Qe4q76v8GsrP6aQAHWwevG/HJl/nb9+Tu6NaQRA6DSrJ5sPsGJea1Z+FMAZ2IqEtgGampX3pht5zFAZgplV4r6+TTOvsqXNTHjbZJnZss3DpUeGz16Z7/QE0pmdSh1kvG8DVFVbDXx++iK5bJrrdHxms0FTpJBwYJLI2WV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6512007)(66899024)(6506007)(5660300002)(26005)(4744005)(6486002)(66946007)(66476007)(66556008)(6916009)(2906002)(83380400001)(86362001)(41300700001)(478600001)(36916002)(8936002)(4326008)(8676002)(316002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?97Cr6apvQ7V6RByDwsmv2PIyOkJsK90uKK/4n96PyXcUNS4NzeaolTYaZLAH?=
 =?us-ascii?Q?FIs4kWs0p8alKOmgkrPTR4Mg8PzyUQzxYovzl+BoAsHNnPxMb2O3G1JvEzAe?=
 =?us-ascii?Q?pLJ5jlL8vnwR8TVkLcyXS3Jq/a20CVcUgIZR9isaPhxH6Wkf9yDzFchL6mDL?=
 =?us-ascii?Q?emBd5dv0bzGyJDplbIen7qZK7wroBqb/qpuLSGceCpGxzvDqROnH6dwvjVni?=
 =?us-ascii?Q?5BgBQc3eXup9EgeVAL0ApmbFqiwy3TEF5NXE9ZUGfmU/akLdHkTffeR+Usok?=
 =?us-ascii?Q?6l0QhlYoy1pH8nSvIYoZCjtH3YdMkh17jr7dALiCRDCFNV5LGuznKIVWTYx3?=
 =?us-ascii?Q?wajuOSKAp+cpnIqkWr707gi4o/ocGRY9SxBXlGgWWqfDGMChh3OtdTfA2zjo?=
 =?us-ascii?Q?AjNImoxZAjmKOaeVgeuWiyKj//Mg0IYt+eyBKTSaoJycKYsYfqoqn8rTIW1c?=
 =?us-ascii?Q?8D9qs4EK2XKwbGuKoTEgwRMhrH6KjAkg3dNsAE5ULNLauTq4fe7+Upm+hOrR?=
 =?us-ascii?Q?9kOTN5/cvPHNmFSdLwmeTXe435ehZtdg08RUfisyVjpfHSpHkzFxjZKo4nXI?=
 =?us-ascii?Q?UhoNLlhydgX9yZZU/QH97pcmVTYKgyPyYlapkQXUN43bkmAroOyYa6dHGTNb?=
 =?us-ascii?Q?1hEwtMjh+XNRk/58fT4PsJssZQ1hl+F7dOKRqnecpz6EDpJDyaoW0ur2DYEP?=
 =?us-ascii?Q?GWyfobwqEqBS3gUmT9FtI/sNDUfV8zgbcHvrA59WzsoxqkzHokWn/RJUqf6e?=
 =?us-ascii?Q?JqTYLkSOu2O93m6rS3QkMxBx4xVILhAHvVErzdQyT8wIkjQ4u5NPbiPoRwXR?=
 =?us-ascii?Q?WvA8Dg5g/SLrIn1rwbXx4ZmzkBtV8IdQFVzFRV96mD0TrvIiB0iK4e5z0MsD?=
 =?us-ascii?Q?jbSsSrNN++UtSSt20lBSjg/3MeKbLsavQbr/+df36tca/mPAqg68+pz9vld2?=
 =?us-ascii?Q?OiOppPLOz92Il2rFtv7JAWZR6ZSbTCgwHBxpxrHHsk22THwz4Nqx32WNQNDD?=
 =?us-ascii?Q?gi32+wLlWj6zK2ZjWukU6fygrdCAz8u20CUjHT4NRg7o+9SVstQ3Bu2M9Cyq?=
 =?us-ascii?Q?JZZqXRc7y386EfcgZNEuM2R6b9rzIzsUXHLthuOOCRrJ2bNvf9Ma9LyprO7o?=
 =?us-ascii?Q?WTkveyRGHvnD61+WPFlH7gexmNNbfsbOSKBVVDl0njpiSoCa3LHMk9zOyP5A?=
 =?us-ascii?Q?6oUUn/WL4dAUKcxDAb8AUsqCDsX2+zv414hTkTVNIasTR90SKZTbOURvkDLq?=
 =?us-ascii?Q?sC322ls4+JldPiziogsDOMm6Q5fEoTPbkW3cEhydukUx/KJH9nqvfYNTTjHY?=
 =?us-ascii?Q?VCoLoK/r1sN0BN4GYq53CAG5368CILnhA8DXtc0CcPs+T6FBcOgkt/KfmtbN?=
 =?us-ascii?Q?XWxy071Jiiu0V+vQbuNEXOpAfO0YP6ijfDZyWk1TO52H79Jol3WJsRM1MyCw?=
 =?us-ascii?Q?TLNwaxOR3nUFkDQGdeNnkWB9yC3COQ/Ftnneyn9z+nULX+Bssosc1zfx1/dx?=
 =?us-ascii?Q?eNsQEuAUr7WCrWjcBP2s9aetP87rFL9UeJ1bJTKCNRRpBtEfY8Ii2RQsC8CO?=
 =?us-ascii?Q?r7WUfEvjHLQ+snZEVEjWzNh/kUJ514PW2aapYk6p14cL/SuR/aPM03bx6E/H?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4m28nhoXImXJ8oQW3OaOojG/wfifZeD72halLil/rgcdq50KcbBtOLe6KUae3QM0E20wil1zqP/06zz5mhUFZIjsPNKmRgUREPsDQyLTKGgNMXUinjwIU4kBg8K3UUFk2TPFSQJc+CoOF9vHMgGtqp8tpCiG8iSeRmIE1d/vKxNv7q1xV0aPn6nxg0yr3rxdruQZ94yqEiuiVzGCPkI8zaG5rXLaA6/azlEu4SgbOyn16TicsF68cw+X5SiU5c+lMUjBHW+P/YrIlsk9oQ9pw0YR65tnG9SyEu38XoyPYbkWifC7T4uyt1rRgv06D4dUbTuD4wEljztSN8zrtj4YyzecO9EX8wqkdOANDrLXk3PkWlmQ37wRn07MLFPEaF02RsxfAqG6GqU8ggedulxdJEzq8M6DIQ8TxRNrGvO4Vs83ZAEwJI8IEjinN3ZicFT607C69/F79uHFpOhST1mS7PqOP+AwFqNvTd60aiPUDM6Sm4NAyHmVWjbrfwVhpQPXdpZ82mOqn/OZL+NaE6DhYrvWX5AOOkZ2IzoEyUykSUKR6Tcq2uoHRwi7EqfdpXZks8UwbM+bhIi++wzZJ2hjG3n38n23hxursh4QftIHeR/Ri/db8wOSSxc2d4RSa8yPEcq81SyUqkAoU3qXPml+Rllu+0K3elvriq9K2nr62UxcJ4CizJSUeWhNf+6qVW9dZ9KDsVrepweURePQFZwxntmE97NHrTktzbkSlKwkVOFmOaCtnq8DfRVaGVrfmKpzq1Xm83CCfJE+zkWJJGly6dztUMGrs/p9L7D8flmIcIN07AAEbqiOPjaIl62+LT7GYLNbjpcZh0y0hE4DV7G82cUDF2DN7pbe2k3in3EVbxq6RujERhujjXiot+3cG3/o+DCj6GXuMeZO5Men04GPkw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b681ea-4e27-4ac2-f2db-08dbfabc07fb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 02:42:49.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dhpb8b7wcAp0LPACtymhBQJb/Oi+QT6tuKXrn7dM1dGPgoQ3hEoE8fy40kunaLqH67lbvmyi0rNx8/OlUlcqpbFMoftc+Q9dlhJE8n+H8Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-11_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=538 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312120020
X-Proofpoint-ORIG-GUID: MDnk5T_zZR1_EltvvX_7tUHJdIBT-ZM0
X-Proofpoint-GUID: MDnk5T_zZR1_EltvvX_7tUHJdIBT-ZM0


Tasos,

> I then called sd_revalidate_disk() multiple times and noticed that WP
> was cleared only after the call to device_add_disk(). That led me to
> figure out that this device needs a READ_10 command before WP is
> disabled.

Awesome work, thanks so much for debugging this!

> On the other hand, I'm worried that by adding a READ_10 before every
> mode sense, something else might break. If you do believe that adding a
> READ_10 is the right way forward, I can try cleaning up the diff above
> (with some advice) and submit it properly. Any suggestions are welcome.

Let me mull over it until tomorrow.

-- 
Martin K. Petersen	Oracle Linux Engineering

