Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF9447A7AC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 11:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhLTKT3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 05:19:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23302 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230057AbhLTKT2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 05:19:28 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9xK1w011045;
        Mon, 20 Dec 2021 10:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wQnAKYBhgpu2Nn/xotyEffaLC3HQowLvCFAXNGw0658=;
 b=E/5+Gjm+VTAMO1Yu+rKyOUWw/pYajcpzN/UkSFstp7tO6PPvuthoi5FKuzIFdzwdT/bY
 gC9BeQ2WAoV8rb5/FayyyDm8qvbH3go0L8DOVJs7HvLzoegXlpNT9hVZIW1CHJKD6Dvk
 uxu4mPKvebe9tVN6eaf6SxdE+aG0TYPGZ1WnY6JYrkrLYw3fUhXUtF0p/lYKJxlWPaF4
 NCtmwZSgDlNjl51QXknML1c8k79GPOCTB8XPMkClh3Mt/CxYQFYTlARcfGNfz2khMyQn
 WV3iqTOA2HWfAaFvfcRKLboKE2N3xJKX3RQ8sgG0M55FdKhZjxEIZVmObHxy3Z5TGkVG Ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3d2qpd01cv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Dec 2021 10:19:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BKAGrkj055268;
        Mon, 20 Dec 2021 10:19:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        by userp3030.oracle.com with ESMTP id 3d14rtvv0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Dec 2021 10:19:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibxZwS1PcrXr8rvKsrt5V6FikvBtnhyuqYZXD/oUfkP6nUyj7MvxPLD6GMYwel0Dd9Tuunwt9IJH5Y3SsQwM0lDHFXBEpmTO7wTTMPq/HxrJkHxBD2Y5ythLllwbkiUFEsK6JO/foaJNXaYFXYbfD2v9jdV8n/iCo0hmejwkTlPE9MdFyfx6kTaJBCbyUCc2x7RH7qKogdXlvbj/le9ILQijSCsgdhKXtRpBwOJ06RO6gi1of3k/otditUjd8VIz04sC8k76XiM48bmUz7cFuVXK7ymhA7DkalKLD9R2M/yijlTuZypr5o81xmz9GvX5iHHFPGKSKS2TkU41o4unGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQnAKYBhgpu2Nn/xotyEffaLC3HQowLvCFAXNGw0658=;
 b=Z6yz/6Z9i8/vyLRBQ0P/959bWyoaOXyDMLFgwmtaDnv5GuzpgiL5Y/zBCwr3PFn8pFGCmKeprf4XkFuDQvXB48kmMHQmOLtyZg39vaGFsRVPLzu+glstGH+nOA78iycjeAHAzlEMEDea5AGtIj1lJBPOSnQPd7JFFlXS7AfXPVB86BKZtGK+UIZ67MASOtvRF5XZ7gaQae437rHfxwQWDrdq7UvQi6fb0u2NyTaDtRQUaCdWUBaxKCTKdaYdKMHQ86WuGjkrDATvWkeISij3P34WuqVh5qbV2h8HihyMqKp04XA7w8KwAAmcKWUh+ly2hHmJoFEZMVB2gr+eHWE0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQnAKYBhgpu2Nn/xotyEffaLC3HQowLvCFAXNGw0658=;
 b=lYVrfJytlhbL/oZl5BuAX91PJKMNJDlpfEGAU/Ef/dhBock3xvNqBuMa6/uogmQodbVJX1uCCs0G7BruvaBdNL3xaYp6DXr77OhWcfqB59wn1IjVnI+HqE29w3Kh92M/sUxfq+XWBh3Mp3niRz0kk9ZMkWlgGlj2flkI+WRkMVc=
Received: from SJ0PR10MB5567.namprd10.prod.outlook.com (2603:10b6:a03:3d8::20)
 by SJ0PR10MB5568.namprd10.prod.outlook.com (2603:10b6:a03:3d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 10:19:23 +0000
Received: from SJ0PR10MB5567.namprd10.prod.outlook.com
 ([fe80::8926:1593:38e6:d05b]) by SJ0PR10MB5567.namprd10.prod.outlook.com
 ([fe80::8926:1593:38e6:d05b%3]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 10:19:23 +0000
Message-ID: <67ff29fb-98cd-1835-ee6e-4eba67ff269c@oracle.com>
Date:   Mon, 20 Dec 2021 11:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [External] : Re: data throttling under load when serial to usb
 adapter is used
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>
References: <738e20c6-c709-d149-fe48-ee89540fe38a@oracle.com>
 <YcA+qegbpj0heal4@kroah.com>
From:   =?UTF-8?Q?Filip_=c5=bdaludek?= <filip.zaludek@oracle.com>
In-Reply-To: <YcA+qegbpj0heal4@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0047.eurprd05.prod.outlook.com
 (2603:10a6:200:68::15) To SJ0PR10MB5567.namprd10.prod.outlook.com
 (2603:10b6:a03:3d8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bdcbb2b-0c91-4e37-ceee-08d9c3a23186
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5568:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB55686F2DDC5E819D28FD53A79F7B9@SJ0PR10MB5568.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: moXHGl8qFHR6M0Cbwb/zdLkaeOGlvTMG45yCUWBJIWFmUImAo3Zc7rPsZL/9sVjG7CEy1mtP+tGJ+J4KVGo30madScmDktPv2WKlUzKK33mRWI7QNIAR/9YfcZ55deaLwNrkBSwFwBPTuce0pG6BPrX2BowndNeaCMqPnnsbps3VjfHSCWS9oR0TTKMYCtWWlzws7wyWDcpceOYPgwchosQoOzeNZD1w8WUdw4+NLBlMd8w+7g9isvQmpcwOjRtnyBF+9LsibIJthEls5u5sqpUdVGrXv8CdCzgKfdpPCzSMVNGlpeFrmKUjP/fQOuUWXA5h1w6LplLe4AVXmsiyEKWRgiVUPrJzM/vCyLrSjvvf/ng4viwF6eKCb+f+6SqdsHsahF9C+/g558Bj+6QvZs3h58eHbwLwpnuMIf+OojLGz2AEP9+E1Of8L/ApALHE6yCL30oJkoDEjmJbxBbZI/rVikXkfVv3FJJCp2g8LkQ2dog8faIUbF8UF82VweBtVj2a8EJtswloK2eG1bVhwFf8+E1TPZO7x4iyGOD8Tm5ASkPb4lW/RE59VmkcR0Cx1Rp+ozz6E9bwacbuAMR08SLLDFzOW/oAAXMygZNIGKddJq9a+x+w+A/fXQz2P35jMMUnrxt+q5v6K9FVpQlteQBQUwMsmnxlel8/Q2G3vJI++iuooen3cIED3zpcg/Ey4Ev2fr3iExi7UHhdLHz0sFeeB5Qy9hNaLlJ5+uqEIeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5567.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(86362001)(66556008)(2616005)(66476007)(66946007)(6512007)(6506007)(2906002)(36756003)(186003)(31696002)(38100700002)(83380400001)(508600001)(107886003)(6666004)(5660300002)(316002)(6916009)(8936002)(31686004)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2c2SjNWWHY2aWRRZ0kwT2FhajZxMnc2ckEwdnUrcHRjVzBDZzlRUzl1UDFT?=
 =?utf-8?B?V1c2czlRejJxUlppaHNRQkFRN1F5WTBGK1dzWmJ1T1Q0YWQzOW1HSEZjK2cv?=
 =?utf-8?B?RzdCajUrOFp5TFFISHVnTW5XQSszbTRYZnI3aDQwb0NqNjlqcXJHdnpWdDJT?=
 =?utf-8?B?NlFWR080RXNxbkd1Wk9TQnNvUG9vSENqZE84d0dvQ3Y0WlJ6QnI4dGZmcDFL?=
 =?utf-8?B?VGREZzJ2TFZQb2lDdDlINXpjOGowUzJxcCtQVGV0bmMzczZ0SkhwSFhTV2xr?=
 =?utf-8?B?OUxkWVc5eHN0dlJWb3lrWVdveWU3eUorOWk3THhUK1lEM0tMcmxPWGxneXpB?=
 =?utf-8?B?WEx5YU9oZWQ5RytoYUR1cFZvamFmTmZEcWgvRFJoc0hjeVltaHY2L0hWV3lx?=
 =?utf-8?B?VURvMFMzS1g0ckxYZm8yYVk3Umh6ZEdRbW91VWRXc3VyeEo5UXRtRGpZTHVx?=
 =?utf-8?B?ZVM4RnlURVZWOE5FSFVrb3RjVUUzZ3FNaVE0bmJtaVErRUxaSEZYL3N4OEFS?=
 =?utf-8?B?cnlaSGt4bGVEam9XVVZrVjJHb3FZbERKSHNPRnZzcEYycU4wUDlDVTN3TTVx?=
 =?utf-8?B?eGIxNnBORXN2RlZjS1h4YUZzZzgzR1dUNEVRQWgvaFZkTTJMeXpINy9OcTZp?=
 =?utf-8?B?UGJpUDR0SW0xNlNmQU0ybUtxZ3l6KzJXb3BPWXFKL09IeG9aZmFPWS9QclBs?=
 =?utf-8?B?UmhHTGhDM1BYcG5KMTZBRjhOS2V4LzZnL1h3L0xZaitMZ1BySzAySitPL2Jl?=
 =?utf-8?B?SUJvYVpJMFM3MytlK0VhMVNoTVdaamZrYXJ2c25QZ1Y4VHZmbjlQTDZIYlJE?=
 =?utf-8?B?Q1lWNjJCTTFDL0k5T0t5aDVKYjZlQUN6ZE1MSERMV2VoRTBvQlVQa1JodzJX?=
 =?utf-8?B?OE5Qb2JJNHplWStxNURDV1dsckhYcGhhcEdhcHU1ZXNHemxEaWllQ2hCWHFv?=
 =?utf-8?B?YmNSOUdkb2h0MGxpd0pLenhNU1p0UmV0WE9FenExZ3BZMUdNejVBd3VXNUtG?=
 =?utf-8?B?QWtYa0xqdFVVam11M1FLczM1OU1aRUlaRVIvNXR6TlVtclhOQXBlSUJ2Y0xB?=
 =?utf-8?B?aVJyR09tL2pVTlRHZ3dRZkM5UW1mRS8rYVMrN1F6aDQ0bnEzd1dRd0daUmcy?=
 =?utf-8?B?ZjlrZDE0ZGllVDNrSWVEN2wxQk4vdmhzM2ljenZzZ1RnSXVQUUI4MnMzUjVk?=
 =?utf-8?B?dlNieGJkWFZET0dNZDFhamZneXgxWXJmVzQ3RkIxeEZ4eTU5U2NueExNNjdB?=
 =?utf-8?B?ckkyM1lzSHE4WnJhUGhzRVFjY3JoblpkTkQvYjBmaFhKR1E3b3lrSGdRWGxn?=
 =?utf-8?B?ZkRIa09sWkNNU1dUdnlCdjF5QlozZFdGRTZMSTBldC9EcmdGcXdSTHFwTDBp?=
 =?utf-8?B?eXdxbU9XdjhyaDFTc2diaDZNM3d1S0NMK1RFMW1KODlDZnVxQTY4bW1Ta1BD?=
 =?utf-8?B?MHl6WHVpWDRJekh3VWgrYlYzNFRnN2RsTFAyNldaQ05kYlRPOFRKNUhsVXNl?=
 =?utf-8?B?UmRPZWw2a1VpV3ArdjMxTjNPRkZ2cXQrWDRaeWE5WU8rQlp2RnJTTUw2VVQv?=
 =?utf-8?B?dVZXSDVFYlhiR1lIbUQzOW5KRnVmaktmRHhoTzNFcGRDSnB2S3RTaThTQm9F?=
 =?utf-8?B?dFNMOUNJODJ0OUFCYjkwdEhMZTlGY3c3OUtIcVNQRFp4OHdDUnNwQkpKTGFr?=
 =?utf-8?B?VENTNlE4dlAxemdTN1VrS29QSzA5aTNieE91NTloaERRamw3V1JxZndmbk5x?=
 =?utf-8?B?QitnQmZCU0pZbldOeGVTa3J0WlZ4SjlVMFNXSUM2ZHUrYTlYbFZUYTh1amZQ?=
 =?utf-8?B?bU5EaDV5M1hRTk1mcWEzSHRpSzZ1bUdzZTcxSTVQYm45ZXZreVZULzBDbi9K?=
 =?utf-8?B?RE1xME9yMVZxK1FzaU14QndXazhTRGErVHhsMmdhL21DQmV3K1RXa0padHJh?=
 =?utf-8?B?VnFadkRyTWgrR3VQemk0WGJZS2o2dGVyQVZWL2pkU2JreXVKZ2MvTlNTUFI5?=
 =?utf-8?B?cG45L0E0SGhXdGV6RnlySU83UFVxY3JvbmtiRTZEOVZyeWtyNXdtOUpZb0lI?=
 =?utf-8?B?ZmlQZWYwU0dHNXB0SXdvWGJGY3JQWWZ2RlpMdlN0amJBTEJ2UWFEZjJqWWZw?=
 =?utf-8?B?aGpzTTJma3A5aG1RWjRTYzBYaEQ5Mk5QUVpkVUNTN0tKNHl5OVBsalJLanJo?=
 =?utf-8?B?cHpVZG0zbURRdDMveWR0Nm51ZlZ3MisrcTF1WXNMYW9QdmhPS3lOa2wxanRB?=
 =?utf-8?B?WkhWMzBvTkhmeGFWSW5tSW9LVVdoSFIrWUxEUTdXTGdpL0k5VXpXcXFSYUVZ?=
 =?utf-8?Q?/d/6RPEXPkr2X79TH1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdcbb2b-0c91-4e37-ceee-08d9c3a23186
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5567.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 10:19:23.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBxxGQH2qTelKkq0DM/3dvhs/17S0kJfJp4pyVqiwrkIm1ptdflOdITDfO2xn8PaByVxMsKxJp7YMLnELnfpQdTmlqEL0nY+VnL/91UNkso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5568
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10203 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=779 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112200060
X-Proofpoint-ORIG-GUID: M8nfvsMjN1NK8HQFQhP_amfqJkSHol9D
X-Proofpoint-GUID: M8nfvsMjN1NK8HQFQhP_amfqJkSHol9D
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> 
> Using 'cat' is not a good way to ever use a serial port.  Please use a
> tool that can properly detect and use the serial port flow control
> settings, which should prevent the issues you are seeing here.
> 
> Is socat using flow control?  If so, which settings, hardware or
> software flow control?
> 
> Also please note that the usb-serial devices you are using here are
> _very_ cheap and not good for huge amounts of data like you seem to want
> to use here.  I would recommend a much more robust usb-serial device if
> you need high data rates and good hardware flow control handling.  Most
> of the time, the devices you have here do not even have any hardware
> flow control support as the manufacturers do not hook up those lines.
> So be careful.
> 
> thanks,
> 
> greg k-h
> 



  Yes, you are right! Such gadget hardware is without hw flow control. I am using
serial line only to capture console logs. I've tested both commands also with
sw flow control ixon, ixoff with similar results.

  Hopefully somebody sitting on scarce big iron with both usb port and serial port
with proper hw flow control from this list gets attracted to kindly re-test.

Interesting part for me is that only serial to usb direction is failing..



Thanks,
Filip Zaludek


