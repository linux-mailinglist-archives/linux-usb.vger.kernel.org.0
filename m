Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05BB06BF376
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 22:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjCQVFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 17:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjCQVFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 17:05:07 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85BE3C06
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 14:05:06 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HIUamB007469;
        Fri, 17 Mar 2023 14:05:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=xm5nM+EGB5P/SW2IDPDHn6khiGKvdQgZN/s4AMo7jTY=;
 b=dVoZGVAR4z/vfsLJPPQ4hrKXJh2nxA/Az1BTcCLpHpU5Gr+NltCuFiUzI9iQgVOu+YlL
 74IhPZlO8jBfzDAm0QAlOXRhnhnqQqKpiRd9ihHfdxpD/V7DVcEYZGQ02sL4bl905sBF
 SO9nhG9ceF/mP40SPXa7UVwbCa5y1OQag9oGojM2/x+QU0EVPBGC+p+DKRBHaJLOADHB
 1PP6x9iSbzHxsu76dv5GagKyeBWLszhPuBSZv9VPoXrFN/urpVCQY8i3MwDLHZ3AF+3k
 379sPzk5pLDEthTXHs8DmmOt4LIUJZ+shDD79T+V0uGqYnu1IQnZfTSbVheCXpnrLEHn Lg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3pbpxskmgy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 14:05:01 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0AF794008A;
        Fri, 17 Mar 2023 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1679087101; bh=xm5nM+EGB5P/SW2IDPDHn6khiGKvdQgZN/s4AMo7jTY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bWq5BURTTsXJprNzVLvg7QEd11R8tN2VJ9FP77zyjoy9kY+PgzTPX7TeEXsYBnL9s
         Ew+q7hY7Mbeeny+IQHkNRj+guzhqBCUFWmWxzXOcysN560bgF5xl0ipijlT2oaAybY
         nEiEim2TxsfVLsb2Q9icqdX4FOe2wjM5MKmWI4pVzzTHZTQqZCaL3gedRZCaOB2oYB
         qOPXC8Zoc8DlOj/1pczeh1nzsM3p2OilXaHemnScBlAJ+qUyHNRneUcb5xoSdyxpLC
         At1p/xvWC0m6lyoiqb4swUqQorAgMahQSyEWASW37tSZmmlBkYYPcGyyCwSriOZjkO
         D9hOa/1OTGaMQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id ABBD0A006D;
        Fri, 17 Mar 2023 21:05:00 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id ECA09801AC;
        Fri, 17 Mar 2023 21:04:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Yp/UzB8r";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izx3T5st+2cF0DUGZ9709n8ttg9Ysuxs8ohdYyqMk+FoC5r5Ci/sQfV0HxqfVG2pG6gh9Ckb2Nj5ygjmIeOMSyAaaGr2TRSmtmCT70GXEedcU/9GyqqLhNVdiy4gPdLpl5oHaUHL1ZxBgowS2te0lNVUPWfR9bUYPlBXAMgGKaYlv9R41xLyayqb3l5Nz42XSg8+YJgjPNLc3oWQ19fbXdqi1nbQPLXwoybKP2SChnIjETON7caBwr+Ew8r//P2FkThii2c2j8Ny6oLtzVVcxLg66DkMo5DMUmRI51cOTbGiJVgOuHo+prrvScczV3J8eMsUargPrIudQ9zIGt5PiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm5nM+EGB5P/SW2IDPDHn6khiGKvdQgZN/s4AMo7jTY=;
 b=MkrzjKg8V1AoDdN/CV4JVKbX5cgjQg/gdzeVx9T6Eo2fXkvJ6bkN/VSi6PAWDV3xnRLCc0gJAbzbOqWyezwpU/2drTd5qatoJAZ9J8UFjstW3AbceVB4ungheL1zT9vJPkUfiHGcKbSYSE6KRvqEAE+P+CuLSQ02t62cQKeTPs8DUNeK7l79REaSxeZKS2KyylLrwNeKv/f9XvVvWVQ0UAubjhMT0d9SFJQJN4rMEwfObah8bb3WFoYse5A+N8KPdpkc/vxiYNQkF8K8fmhNMxLznqDjfztYN8MQvOdgUSh/HIGx/amszY4fD6llGo3aaevJ2H6ydoc5jXjVjSFlEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm5nM+EGB5P/SW2IDPDHn6khiGKvdQgZN/s4AMo7jTY=;
 b=Yp/UzB8rBB2iYD6T2bxocj+FDdUJOKDYLjByxOtSVT1YhiLIIVW4FgxfYXIQsFUNYxhflEkDcqm3Cy+TgB6oYlgg0JNpvy0SdtqPlYgowwPQ5OERTnGlnoJsxYenQ9rAWZ/vMxNask7tz3XnwQbI2vNzdQtwq9j5P85l5AYesu4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 21:04:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 21:04:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: add several registers dump for debugfs
Thread-Topic: [PATCH v2] usb: dwc3: add several registers dump for debugfs
Thread-Index: AQHZWLId52LtXKm1W0ylcMhDU5WBSq7/dtUA
Date:   Fri, 17 Mar 2023 21:04:57 +0000
Message-ID: <20230317210450.72l5r7vk5cfmpyqo@synopsys.com>
References: <1679043328-13425-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1679043328-13425-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CYYPR12MB8922:EE_
x-ms-office365-filtering-correlation-id: 8948eece-1c63-4488-179a-08db272b43d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8lagPKaBMq0nDwnPngxFBI4UtnYd4vmsoFZqBis+6HwNXKCCEOG2Zv9i1DMh6Zv+nvW3tCj/+NGL55mRJGVBXe7HR45+3zsJM59T6yW1gL3sdNsmRGPpKUwLBZMPyzxPrwA89Aw5F71Cb9PUq3I2dCE0zrbKk5gz/EszMtExCsYaUESuP2doon3Wllhs5HYCZWX50r03qTUmL9NdfvMNspMBv5h12zNu8t0orOvRIWaZ2f2iITXhUfdzswYF1gScRVJfX9KOUghYLbmoWeycHWndRiBslaf1LcAucBpE0OdmlvSHeIMGw9gw43lE5nG9JnWY+usUSb28FXFHxC5S3xD3lcoDu2grs1Skuccen1gxujbxmbDryBQ5Yu/AmXPDIxJJ46TPYKOJNZVMPY68pFrBku3ii/5I4kyKLU9jLxw/RP8RGaRHv1kXbmCic06Fg29AunUlLRr16dTRNrtB3t4YVmGSWQfNqbHw1fCPYRAsQ3H8t/m1c/QidmFEZYiMqBI8bVqgz+0axiNWasyAuuhf7BlTaHgimBFhUAJJP7a0sjUDHqkKYpq9h0cBw/laFpS5wWEerTDAurbF+5suD4zpDmPq9a2rqboHLAuWmacXj7vXinhfWBEjBf3NR8lxakJVTiDRDRqGSKYssFBJ23mOaLAx95FOXA+0io+nHGH/8Ik8PauaBN30rVh49ja1EgKJlrZiQ7IYedkACGhI+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199018)(2616005)(26005)(6506007)(1076003)(6512007)(186003)(6486002)(316002)(71200400001)(54906003)(4326008)(66476007)(66946007)(6916009)(66556008)(76116006)(66446008)(64756008)(8676002)(478600001)(122000001)(5660300002)(41300700001)(8936002)(2906002)(38070700005)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2gyWDd2eVdtNUFMVHJpdzVVL05iZ2o4RWpnL1pUR3J1YkZsakRmZWtDdTVz?=
 =?utf-8?B?dUYzdzBuakRXSmZNUnhxaFhkY2FhTXBEeC8xZGQrVEhKQ2ltdEg2RzJESStj?=
 =?utf-8?B?K0pSTUpFc3JZUHoySDYweUJIK2J4RHkzUis1azBkcnFqRjVoYjJnNDFmQ0Fj?=
 =?utf-8?B?TmxxeDlpMjVaZnJaRVBvNHRKYW94NUtSeTF4c1pPbi96eEQwRDdLQUpGMHdI?=
 =?utf-8?B?ZmVPc2JQdWI2eng3L2x3cE9NSmhNVU5tRm04QkFJSzhPOEdzeENjdW5wamd2?=
 =?utf-8?B?aVUrN2RyQ2lXUjZZRXpJOXROSGIrQ2dMS1VkNlhnQ29NWHNjVXpCSWhaUFpr?=
 =?utf-8?B?WWsyWnZpSDVyV3BqN2ZlUFY3U1FqYW1ZRUF1OFJMMFNEYVFCQldtTHpvdHAr?=
 =?utf-8?B?M094UFBRNmhlV0ZiOHl1VDNSOTVFbTZmUzFvaitjYWNoS1d5STJ5RTNLcWpE?=
 =?utf-8?B?eVkvR0lUUEhpMXY5a3lUMko2R1AxQ0g2bHVWRFQ5UFJKeGxnQlJqQ2R1b3VS?=
 =?utf-8?B?cnRCM2RxL1hxYW1yRWVYZ1gxaStCczN5VldlWCt5OE90Z1FoZ3JCVVJEMzJT?=
 =?utf-8?B?OUR6Sm16bGhjTWxyL1JXbkUrN3J2YVg0cVE3bUJZVThDeDNWbWcxTkhiM2Zq?=
 =?utf-8?B?a1Y0QjRLSUkwdGNBZ29hWXhVWkg5anJXRU41ME1lekZYZnM3SmpPWmNaR2w5?=
 =?utf-8?B?VW5tS3N3U21TZ0h2cUI4VGpOdmZyQlVVQUZGV2dWbllFRzRzcFFlczlxUGdp?=
 =?utf-8?B?ak1ISnp5bEdaSVJOeGtHdmQ2WVRhNG1odWNWNVRqUTc4TEkvZ0JrWWs2bE9I?=
 =?utf-8?B?bEpUQWZNZWRNVVlJa0NxUTdpWFdUWitiajcrbmFIeS83a3BQakhUUG13Y3RV?=
 =?utf-8?B?SVpNSms5YVhyaHdZazFjQXdPWnVLL1dubkNZSUlpMXgwenFPWG5iNmZBWDhv?=
 =?utf-8?B?S09CelNqVDFPeWZnZmJ6VlhrNVRKRHRwbmxKc2s3ckZSZW5NUktPdFJxVU9s?=
 =?utf-8?B?cXgrR0JlR0MyQnV0WmZvZFVvOWFGR2lHQThKN3Fhd1JsWlNxeU5zQ3RGTXIz?=
 =?utf-8?B?bmI5MzE3MFVxTkdQZWRhQzZtYmx0RHd6eUtEMmo1cXdVMXJlWXM2bFZJdVBF?=
 =?utf-8?B?TVM0d0p2TkZVbFY0N1EyRzFmTHJBT1RvMER3U3QzaU5wSU02OHEzM0lOY2NM?=
 =?utf-8?B?dEIvU2czTGxjNzVhb1pyNWE4TUdKK3JBbjJrUDU4Q2owV1l6N3liVzdqMi9t?=
 =?utf-8?B?RXhYcFU1ODhoZW1tTWN6ZlF1SitONmtvVWtobllZdlkvM2duNE16OHRUOUlQ?=
 =?utf-8?B?czduMFMvUy8yK1BoUG5FYWRwVWoyRU5Ba1J3dWtad1ZSUW5Oc1B2Rkt3T05U?=
 =?utf-8?B?NFVQeVg1dkZVVzlDZm5UVGM4WGp4T09maTlvdEZDdG9oWUozV3BZSlUyV2xw?=
 =?utf-8?B?OEpkT1ZpU3BjTHdrRU11RklqaDVWUmY1M0xkenVQcFJtaFkrNWR2cFBUVE1U?=
 =?utf-8?B?WTlmSVFZQVVkY1IxdWkzKzltVGx0dStzNFVVdG94ZERLN0NPNk0ycXdhK2FE?=
 =?utf-8?B?R2tVaHk3cURVOXZQU0plTEdYdkRXd3hTSm1wZ0o5WStQZk5KZHptNUlYenh5?=
 =?utf-8?B?WWhhUTlhZ3pQWGhnckU3c25GTFdyc3RROHIyQ1ZWT3EyWDRtTnMxWmNTTEV0?=
 =?utf-8?B?T2IvMk8xRUZycnJhRVRIaURDYm5BNENKVTdiOTFGdkl4MXV6MjlIUFpSTDdl?=
 =?utf-8?B?VStvUm9qbVdUMWhHMEJtTitaSFQ5cE41ZFliZGhzS1Nxck01Sno3Y3dxejFm?=
 =?utf-8?B?K21ZOWUySFRZQzdKUU5vd3FteGYxODhJS1ZXR2pPQWRpZ1I2T0s4ZFFTSnV1?=
 =?utf-8?B?VFl4V2FVOUFObDc4MExjSnJjRENZaEpPdVBUdTdLSFpCaW5LcDNheEFkMUlG?=
 =?utf-8?B?dzNNRDM3NFEvT3oxOE5lMzRVTGM4L3FzWjIxUmhKWXhsSHRVR0ZqbS9WdGVl?=
 =?utf-8?B?QXlRVDJCSmIyTEx1YmRGZkNjTy82b3FqZkkvd0I3NENLSmI3dlJRT1dqT09j?=
 =?utf-8?B?TVBDYWFhYm9sa24zZ2F6MXlqWnBuanJqcmtUeWtLSTNBbGdQTU5CeEhRdDgz?=
 =?utf-8?Q?VXi2r99ZUFLcdLnaS12ROq2OR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5D86B47B04F5243998FBF0CC9A4303B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DQny36O77Rz+AlNa3duO9r/RWkIECEIBh1vsXPDx2OHHRFf0zSOBSt3bSL9i2lrvTQRw/ngBWbXjxAUjnCd/yCpYWn+9El1zpNn6zzwf8teVY6veqD2vaAI5KkPjcApfcYCQzB5fnEHxz8iLUiMplOpoqm4W3t4sr+OUKJPXPg4RZgcK58Ak+PpwaJy5e/iaCiQYjd3etiY7qtPWHoQrXNm/6FUeGVFxX/+5Dyial2zSAk86fEDAXcMGe4l4MhQq34whABnUPvyw4wQz/tnXzi4lxB8jLkt3YQp2t+hfjB3giAHZK/YY3gzZP+BL2DihhAEXGJt0y5zMEPMq9GGU4P/KEzUqDTa0VYSy7Oc6TIcW7piAPNWpVRMginXQ3AQezZQpPTswH7GP1XWXenyxq0zWys7rbfB5ulwPHTqg+0fwcjYQzPkKRE49qej+AH2q8O6q1LfJqVlovvIDAMx2hMMTEYiXONqYVJCBvsG/GADeQ22pwrIUdr90D1PZkRaJId1rjKCnBTn4NNDY595Lc2Hgps4U+IXM1LYX7CeLrEd8jYtAAaXN15qYw0luqdsFJ+QF0QLXYMWEd2pmLhs8cQknbapSiGLF1DFP6VFrVNoalmkXRBEu+D2+sK0RYgR8eIzCMXUernhi00NcmMS9wBX7RurIV2e9yoyFonzcsg3Hw6TAFFtkcBKmsWbg8WTStfhKQX4zi1ZD+H62p04+dzOiAEdblU34rluCHIcBJ4zWrArJgKYFWpB6M62uXkQW859Uxt2UoWdp4kOVZyuzQNAt8bVBCnmidkMKdDqNscQB7AoEXpLcmnm5YGn7E1sy1Xbycb/hQBNTR5V49IQVu5+9ZPFmHuTX3kFkBWC0dt9tUWKR8a9haGIfR7NKW017
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8948eece-1c63-4488-179a-08db272b43d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 21:04:57.7547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YDpvLeJ8a/3XlyFQQo14uFPPgfB8nnH3B25UwApGVyCvIc0dTD6VhmfQ9JfRqpF64+RAFI+29IokXjVX40AoDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922
X-Proofpoint-ORIG-GUID: h1b2fbBwHptZVVGVZWCEk8lbGgIdyWAe
X-Proofpoint-GUID: h1b2fbBwHptZVVGVZWCEk8lbGgIdyWAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_17,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=729 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303170148
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBNYXIgMTcsIDIwMjMsIExpIEp1biB3cm90ZToNCj4gQWRkIDUgbWlzc2luZyByZWdp
c3RlciBkdW1wIGZvciBkZWJ1Z2ZzIGFzIHRoZXkgYXJlIGluIHVzZSBub3cuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiAtLS0NCj4gQ2hhbmdlIGZvciB2
MjoNCj4gLSBBZGQgMyBtb3JlIHJlZ2lzdGVycyBkdW1wIGZvciBkZWJ1Z2ZzOiBHVUNUTDIsIFZF
Ul9OVU1CRVIsIFZFUl9UWVBFLg0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIHwg
NSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIGIvZHJpdmVycy91c2IvZHdjMy9kZWJ1
Z2ZzLmMNCj4gaW5kZXggODUwZGYwZTZiY2FiLi5lNGEyNTYwYjlkYzAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZGVi
dWdmcy5jDQo+IEBAIC04OCw2ICs4OCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGVidWdmc19y
ZWczMiBkd2MzX3JlZ3NbXSA9IHsNCj4gIAlkdW1wX3JlZ2lzdGVyKEdQUlRCSU1BUF9IUzEpLA0K
PiAgCWR1bXBfcmVnaXN0ZXIoR1BSVEJJTUFQX0ZTMCksDQo+ICAJZHVtcF9yZWdpc3RlcihHUFJU
QklNQVBfRlMxKSwNCj4gKwlkdW1wX3JlZ2lzdGVyKEdVQ1RMMiksDQo+ICsJZHVtcF9yZWdpc3Rl
cihWRVJfTlVNQkVSKSwNCj4gKwlkdW1wX3JlZ2lzdGVyKFZFUl9UWVBFKSwNCj4gIA0KPiAgCWR1
bXBfcmVnaXN0ZXIoR1VTQjJQSFlDRkcoMCkpLA0KPiAgCWR1bXBfcmVnaXN0ZXIoR1VTQjJQSFlD
RkcoMSkpLA0KPiBAQCAtMjI5LDYgKzIzMiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGVidWdm
c19yZWczMiBkd2MzX3JlZ3NbXSA9IHsNCj4gIAlkdW1wX3JlZ2lzdGVyKEdFVk5UQ09VTlQoMCkp
LA0KPiAgDQo+ICAJZHVtcF9yZWdpc3RlcihHSFdQQVJBTVM4KSwNCj4gKwlkdW1wX3JlZ2lzdGVy
KEdVQ1RMMyksDQo+ICsJZHVtcF9yZWdpc3RlcihHRkxBREopLA0KPiAgCWR1bXBfcmVnaXN0ZXIo
RENGRyksDQo+ICAJZHVtcF9yZWdpc3RlcihEQ1RMKSwNCj4gIAlkdW1wX3JlZ2lzdGVyKERFVlRF
TiksDQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
