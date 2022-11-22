Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D0B633227
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 02:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbiKVBau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 20:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiKVBas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 20:30:48 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B658597A82
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 17:30:47 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM0o4wp007567;
        Mon, 21 Nov 2022 17:30:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=PHtDBmy5/StuTJdcGD+bRlfeMV3F2b8Ea2T2tX7CrGM=;
 b=YED0Gd+x0otTTT9XJ1exnJj4lzIwnGmq5HVd3HunHxS9CqXfiS8Ow4mJNPpQJdGyvAHt
 h09HlUo1UpYc6+h0tRbDyHfN+paQTlpS/cPk/t2mJNefW8opT5MBfvWEPkrFRC7T9c3/
 9BuhtDGyHTUb0GQmfcoa5TDF0EbMhwpFOie/zguWkF2Qa0TwB8md67ymllDnA4GD0FRN
 BZfUEjw6UgBmeG2oKQzXUpma3F0Y99I7DL+Jihs+tGR+wFkxSk2tp2NWBD1EN2EpO8ot
 6NPwlnrLBAha4EM/uCnE6UVd2YbMvAIoLeSboy08ZsC39FZ9A/aI0NUS/viADT/Grun3 6Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kxxxxj10p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 17:30:44 -0800
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0D64C4008A;
        Tue, 22 Nov 2022 01:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1669080643; bh=PHtDBmy5/StuTJdcGD+bRlfeMV3F2b8Ea2T2tX7CrGM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=LlkJZwcVphlqtW+SNlGK87Reo6pFQEinDKmnJZkJHceJT2Vie3KEZRA9jlDMtRZM6
         MVSE4bZM1pgczFR4l5BMt+WTzvtSJSRHcHKEGltdPAEcoNPCSPVV2jljqam9wwzYP7
         PgHHnOpTSNEOGM/hXXQzQkyAMoTt5ogt5/KNUMKPkQPEDA8boU5x257HEgR82aPkTR
         KYvYwRwJteMYRNK4OCDfTfsN5VO2u3C9tS1AuUAbKLAAyW2fZpyTVcOg9w997s0nqK
         18WVz/ACtKX4YgubOVki7jEOhF4KyMU6i3EcuR98vKqcKe0Acy/A8YL0YHmqp7jNU7
         R0NLTMg7JgQig==
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5C693A009D;
        Tue, 22 Nov 2022 01:30:42 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4106CA008A;
        Tue, 22 Nov 2022 01:30:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="IrFuUEHv";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByRmENZSjtTYHdfxxcF2cIhsz4ZIyWB/E0p2YRmzEZwd1S2De+TsWzdrPzXCdXHC4rc4Ze//dIf7Yqm4Nb0ivcjHXvPSDryyemQR6QoRyi6m0tAxHngTDwNMIXrleusB8FX6+flGEWcRzYJoACpoily3ivdg2bX6YgWySpcJyneXxO28dl7xjbx5qRlVfL0+b8FVl3SIB67HUFbDc7gk2QCQXWEE9gO57zIkm4Z7Gah+Z8+W2j5IrPyX7k9L8PdQR30Cp1deq3+mDNkBrC+yZKwshZwqWxTHuYJpA4EictxJJiiUNjatdSsebrh1mrA4Fy7Nc2c9OqheBVSLdKnSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHtDBmy5/StuTJdcGD+bRlfeMV3F2b8Ea2T2tX7CrGM=;
 b=YSwOWPGgFNkzaQC0ezqBTAgYtqKAjZqK7u509cKFi7N/FTiWJ5lSWWeyzYVYINLqNdIt5+MljfIgvIIDCaF3n5kiCE2jBn6WguLYhebDcWND+49L53uJSjDsvZoyycECFwLKBDWAmpXUgyaYXAOq+fOGmxnTe34SinDAS8GTE+bPOjrfc7flUEokAjGsCY4u86AzpznVpLu7lOW/u9k/E5byqxzcSEBIx360pBAl0aY5STkBUPMQdqf+OzoxGp3Rs2qovZqdHhh6ds2Ix/32LpHB4EMeh3/l6VxmnzH1IxgETZz5kJUXnLF8UcS1VtW/MaSE2lms3mc4Qz1dlzqp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHtDBmy5/StuTJdcGD+bRlfeMV3F2b8Ea2T2tX7CrGM=;
 b=IrFuUEHveX3wBzUZA097+lAotiTWmDcEoOLGWde2lJixEFP9xZIxxAwVoNysw4bQSYbLqYRJM47kK7K174iRazpp0gT22XwsS6g2nqvitxFasQBQX8fC/4+qgKKs87q1VXvricPzCJtcS/Bbc1+Q+oOD75mvuUngmeSZCCtMX7o=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB7647.namprd12.prod.outlook.com (2603:10b6:8:105::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 01:30:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5834.011; Tue, 22 Nov 2022
 01:30:38 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Thread-Topic: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Thread-Index: AQHY+khxkuNi6ALG7k2qI+0H9sR18a5D7tWAgABETQCABfxUgA==
Date:   Tue, 22 Nov 2022 01:30:38 +0000
Message-ID: <20221122013033.if667zpm2p47he6r@synopsys.com>
References: <20221117054917.30104-1-quic_ugoswami@quicinc.com>
 <20221118020141.fjngcaovttbzkbvv@synopsys.com>
 <93e1a840-6d9f-9a6a-d848-d006f1333d18@quicinc.com>
In-Reply-To: <93e1a840-6d9f-9a6a-d848-d006f1333d18@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB7647:EE_
x-ms-office365-filtering-correlation-id: d367c501-90d5-4664-f976-08dacc29295f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iWyBOpVxF789fRhya/m96vuOAruOorvaLIgSGLKQ4kzR1nv0Ftgjcc40o8VpY5SHVJA1PFzNiQiPYv+Jt84Pn2YW/hQFjvix7qG+kCXgz8/gJfuvB6zMmp+d+44fJTG552SK3gp93BRQoOVK0ySY4HdbQ/rE9Zzb17c/CObaTx2FikhZOCNLK2l01x1sJoMVfVlchi1FAWlZKh/6/alFugVXRchu+vz+IUbyM6QjDY8dPEsSF6FcuSiXFM7rphrH3zUd7oL0l2HfuPt4LmTELRA5x4dUpebzQo1oaot16SN71TE0bTZXsaHxQK98DB76OJjtGHotFCYYr4OAnmMonM9LOcetDATFXzebUog7aAr14xkP1umxyD06Jih6v3alhCr0vCr7BlP8Q7VJiY5JIwJ6aM+yf/AAYuqWTVAbNGgpZ9cO34iWeIYIzu9TEeYIkOYhMac5gBkc0PQ/zXa9vojr/Sahq4INtpODvsUyOOnATCR4oqBfIfEH/2vHizs3eGZG6OVsa5xZU00ffon7Z1g+ZevXIq9mMwbIqNrH4nKuFjYvdYfybyN0zTDdQSxFsrJzJVOYWBA2p2uii+bm3RChO2JJnaos1DmIcnrZOkHVSV2b1H3b7IhF5pFjgT5YtHJnNChXMgF66TIjwLK+VVlvjrL6Ekca5FUc11cELPxzF9lyQbS/ojcfJs6Jk+xr2mQxh/iFq1Gy9IoHh1WuOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(66946007)(186003)(2616005)(53546011)(1076003)(6512007)(6486002)(6506007)(66556008)(478600001)(26005)(2906002)(36756003)(71200400001)(122000001)(38100700002)(38070700005)(86362001)(83380400001)(66446008)(64756008)(76116006)(5660300002)(4326008)(8676002)(66476007)(8936002)(6916009)(54906003)(316002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzRINE1ObEtORXZVY2lCWXk4TlY1dk9haThjS1hHdW9WR2Urd3QwMjJtbEJt?=
 =?utf-8?B?a2ZYSXI3ZFBnWmNxUDZGSnN1MFlaYkVuWms0dStwekt5U1krTjg3bVdEdmE3?=
 =?utf-8?B?ZVZGVXhnK0p3S3gzcUttQ1htbm5YdktJT1V2S0U0WEc3Y21rQVVmMlQra2xk?=
 =?utf-8?B?ZjUwNy9scGovMEExRVE3M21uZll4SG81b0NjM3RLdUE3MmpObEdDTlpyOG96?=
 =?utf-8?B?Nmoramg0QWxBclV6WjVmL25aTlRQQXV3TzQ3STd0YTVHUUx2OEl2ZTdCbzRU?=
 =?utf-8?B?WWQzUWw4ZW1kSVBZWWZETzExVm9ZQ0dGN2g5WEhuZENhK2tBMThaUWlkMEpk?=
 =?utf-8?B?aDI0VTRxUmZmdlZkTm5mQnFYczNGaWVPNzRJMitTQlljZWNFaWpoOGQvYnlv?=
 =?utf-8?B?T1plY1Z1NFh6bHp2cWtKZGZCL3djZVQ0YitQREZBbC9SWDNLVlVYTGRsVlJn?=
 =?utf-8?B?M1psa3Q4MXIxUS9Rc3dvaUpiSlhKM0FkbWFlNklHaWI5OS85cHkwMUtNRkNR?=
 =?utf-8?B?SUxyOHlsN0VlbjRQcThXempzTUJNd0FZOG1iL0FJU1hrOFlhVFRFay82a0wr?=
 =?utf-8?B?eXZEMDRhZ2Z6Tlh1VWJqZS9rNFpjemRoSnRFd1JJbC9yR2RjRnB2NGZyYlRt?=
 =?utf-8?B?QmRyQjM4Q2lxQ1c1UTlTTDBaMVA3NWkvN2hQSmNtTTBTK1pVSjRKL1ZFZzhG?=
 =?utf-8?B?UUptMmRXNmVyMEdzOGliMnRUSEo0RzZsV0IvazJta1lXRWo0ck9kcHlRdVlG?=
 =?utf-8?B?MzRWS3hYa29odS9Yc2NTQ2xROElIK0RnNFJTK25SN0hHa3A4OWI1L2VWdmtm?=
 =?utf-8?B?UVREV000NXZDZlk5YXpnMnNLaGE0UWpiTUlqeHQwSmd0K1lJZHlyUy9Gb2xS?=
 =?utf-8?B?RjhLdE1tVUxGTWs0cUtCRnhoSkZzU1BGUVd3SFlOVXpkcExZREhadHM0S1A2?=
 =?utf-8?B?dnMwR3NNNEtLenBmRGl3V2UzVUVyT2owcC9zVjFadjFrRHFESlhZTzM4bDF0?=
 =?utf-8?B?ajZNNlNQaFhZckNyMHBlMXRvaDJiYnBSdExLcFQ0Q2lnbkU3bTJRV2dXNUQ2?=
 =?utf-8?B?MVZHT3dHRElUc3IzR2FjV2t6c294UjZ6RTM1SDZ2dnFnT1gxTW9uUUVXcjNx?=
 =?utf-8?B?dWhkSWdSWWc0aHRBUkhOeVhTbnFSM1Brd1o2bVhQN05WMDczTUNzQUhYSWRY?=
 =?utf-8?B?dHlLZ0FIN0d2Z2VaSEd4NWUvNTRtdXlGNXRzbEt6QjRuWE43dnFmVWNMSTVo?=
 =?utf-8?B?eVlZdWZEOWhMNWJxTTF6RXZ3OFBaMlhGbXBhaFliYTRmbXFNTnMzZ21qSGpL?=
 =?utf-8?B?aHJ1QTdnd0pyVzhYQ1loTVVNYkw3akc1RkdjK0tvME1ZcE1ua0ZXMGI0a3p5?=
 =?utf-8?B?eVEzMEFPb0hQSHJqMEpYSTVmVUo3cWpINHVEeWd3ZzdiVElHWXVQVVVDT1Vy?=
 =?utf-8?B?WXQ0QlpiZWJPeWVzQ0g2ZkFlZFlBWVduZ2daYTVBMmtteFVEd1ZMN2tZUU9i?=
 =?utf-8?B?Ykdwc3dHZkFmOVkvTm9saHZoaksrbVBIcktJZTQrR2ZrMzI3YSs4NDVvYkRm?=
 =?utf-8?B?Z1pDNUd3My9zSU1iZzVBcmFCOVJ2VkhCME41M2s5Z1RPSFRyamYzdEZ6aE9U?=
 =?utf-8?B?TVhkbWRpU21nV3plOHRFVlFTVk5yYzZ0dkJQd2paS0tMUWU1dTlnUlg3d2xV?=
 =?utf-8?B?RjQvQmJzR0VZNXhRWHh3VlJwVVg0Z3llTTdmb3M3LzNkTjNtbUNSSTd6djcv?=
 =?utf-8?B?UERFY0lER2tlZGM1Tzc2RmwwT21IRFZDb2V2Ui93Vnh5aGM4UURiSC9HeU9C?=
 =?utf-8?B?QTREWjd2TTBEYkcyVHpwTmswNUEvU1o0RlhLZzF3ZHRnaVZNc1hhQTI2Z0tD?=
 =?utf-8?B?aVhsb1l2bEpxa1k2TDhqaGhMcmJpdXhyZkRSMVNUckpwYTJaQWJkT3dXYkRB?=
 =?utf-8?B?MlhQVkpZeFZGODBuRFFEUFUyNzBwRGk1RnhHVXNoMW90SzY5RjJUOUxVbGRZ?=
 =?utf-8?B?V1p1a0svUDYyM3pGWHphUWhsVTJpS1lMMkZicWtzM2YvNHZHZ0N5c0dYeGd6?=
 =?utf-8?B?UWdJcndGMnd3cjNIM1ZqdFQ5TXhlc21PRzdIYnlMZVdIMEtkVU5SMCtYaVVK?=
 =?utf-8?Q?OCxXjMSQa/TBm41VICjDJNKQf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48587432E360B349B9BAFA0F21F538AB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?K1RnelBoVjE5QjI4b1RpRlF0UkM5ZEU5cWxROXdwSis4cVFzVkdVdDBtR3RE?=
 =?utf-8?B?bnliSjZWb3VMMnM1R3A2Uzh4enduMFRUenBVM1lpS1lhOTgwRFVKMEN3d1Bj?=
 =?utf-8?B?Yk5sTDcyRTJqbGpqWVdNcks5dlBER0puWjRWY1cyYmY2c0RXc21FWndhMkZ3?=
 =?utf-8?B?L0ZYaGplbjlqVndwaExYajByd3czbStiSk9tMTJlU0J2V1RXYWRDTThnMmcy?=
 =?utf-8?B?ak92ZEUzU1ZRTnFiLzhBNzBmN09ESzBZbk9sU2hRZzFBa2h0N292aW9SWVFl?=
 =?utf-8?B?TmRhV24zcExIa1c0cHVDL0NlMVFncUI2c25weHVISmY4SDdPbjZiazYzeHVx?=
 =?utf-8?B?cWI2MXFrSDJzbDBjZ1dCMitlcGR0Wng3OS83ZTZJS25zazhnd1BPMkdIeDYv?=
 =?utf-8?B?TzBnZ2dJdWdkeGlFQlo3UlZVQTNmR3BPZ2NoSHhsbWo0T3MzWll5TWE0TkVo?=
 =?utf-8?B?czNQVjNnUzdNTkF5ZjR2M1RaTi80TVVJaDlNZlE1eW5hMVBmMkdFbkZnL1Iw?=
 =?utf-8?B?Zm9UcEJpTzQ5WUYxSXdtcmVRTlJEUXEvVzVZZnhCbVRZRzBrcWV4VlNOd2tl?=
 =?utf-8?B?K3p4SDlqMnZIY1FydnZqRUR0ZlZ6ckw2akthcXVDbC9hS0FoeTRuQVZaZ2V6?=
 =?utf-8?B?VVhGbHNoanQ2V2NDdmsrbitZS05CZFIwQ1Z3WVR3UTJML3R3MFpodXREcThG?=
 =?utf-8?B?ZG40VEEyb3N6WlNDTE5sR3AwMEpiSUNCTkJvRWRNZWY1eEc4eWFWeWViOXdn?=
 =?utf-8?B?MXlLNkVFN1NtL0xpNXV1WVc0cEFLNjk4YlVNNkFGMFlWamxVb0FKUUt1U0Y5?=
 =?utf-8?B?cWEvUEswdlhDQTRsV1JFV0NwZ0pzSHQyU2lTazYxU0dPZ2VtaHNtMFJ3NzB0?=
 =?utf-8?B?dEJUMlJ6NTBzdGFJS0V4Vzdkb3ZIb2xCZUxPMmhDNm1tWXNocDFzU3FjQjBV?=
 =?utf-8?B?UkxvT09pRFhqMUxnMFJYTjlaeERXNkVleVoybHRkOFhNN1JjVG04S01lYi9s?=
 =?utf-8?B?NTRISHJyYmhEZVZtdU54aUlGN2tZc2dLMzF2NDIxaXBndkRCTzJOd21MZXdX?=
 =?utf-8?B?eTBLOVJhaWd5NHYray8vSHA5UTkwRmZoZ01McWpWZkI4RHBDeWxxZ3M3Z1R6?=
 =?utf-8?B?UHE5aHFSSk9kN2s3eWhaRDhmYjFNWTFESk0rWGVPaHRXRWhIUUVRVjE4RVZt?=
 =?utf-8?B?TVVtaWpVbmRFNUhVdFZ2WjV2Yk14WmZ4RFlxSnRBU0JpTm9lcFpURGxLVmdJ?=
 =?utf-8?B?Mm5MZitESER4cnFqTHdjdUEvV2xEY3k0UFpJdVpFaWRJTXhKdG9EajdJR2J0?=
 =?utf-8?Q?XSa4ln1O3JMYI=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d367c501-90d5-4664-f976-08dacc29295f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 01:30:38.5758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yGVI21KN0ZnDkfw556OUOj9ixsXc5FZF86LonJLnp89eFDMQzxriP9e6mm/BtN1Foj0ynBeKEEd2pJbUUOfc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7647
X-Proofpoint-ORIG-GUID: Ihl8sHwrdhFU0Q0Ey8Lw1waE5sceCGoK
X-Proofpoint-GUID: Ihl8sHwrdhFU0Q0Ey8Lw1waE5sceCGoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=800 clxscore=1015 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220007
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgVWRpcHRvLA0KDQpPbiBGcmksIE5vdiAxOCwgMjAyMiwgVWRpcHRvIEdvc3dhbWkgd3JvdGU6
DQo+IEhpIFRoaW5oDQo+IA0KPiBPbiAxMS8xOC8yMiA3OjMxIEFNLCBUaGluaCBOZ3V5ZW4gd3Jv
dGU6DQo+ID4gT24gVGh1LCBOb3YgMTcsIDIwMjIsIFVkaXB0byBHb3N3YW1pIHdyb3RlOg0KPiA+
ID4gQSBkZXF1ZXVlIGZvciBlcDAgbmVlZCB0byBhZGp1c3QgdGhlIGhhbmRsaW5nIGJhc2VkIG9u
IHRoZQ0KPiA+ID4gZGF0YSBzdGFnZSBhbmQgc3RhdHVzIHN0YWdlLiBDdXJyZW50bHkgaWYgZXAw
IGlzIGluIGRhdGEvc3RhdHVzDQo+ID4gPiBzdGFnZSB0aGUgaGFuZGxpbmcgaXNuJ3QgdGhhdCBk
aWZmZXJlbnQsIGRyaXZlciB3aWxsIHRyeSBnaXZlYmFjaw0KPiA+ID4gYXMgcGFydCBvZiBkZXF1
ZXVlIHByb2Nlc3Mgd2hpY2ggbWlnaHQgcG90ZW50aWFsbHkgbGVhZCB0byB0aGUNCj4gPiA+IGNv
bnRyb2xsZXIgYWNjZXNzaW5nIGludmFsaWQgdHJicy4NCj4gPiA+IA0KPiA+ID4gQWxzbyBmb3Ig
ZXAwIHRoZSByZXF1ZXN0cyBhcmVuJ3QgbW92ZWQgaW50byB0aGUgc3RhcnRlZF9saXN0LA0KPiA+
ID4gd2hpY2ggbWlnaHQgcG90ZW50aWFsbHkgbGVhZCB0byB0aGUgdW4tbWFwcGluZyBvZiB0aGUg
cmVxdWVzdA0KPiA+ID4gYnVmZmVycyB3aXRob3V0IHNlbmRpbmcgZW5keGZlci4NCj4gPiANCj4g
PiBNYXliZSB3ZSBuZWVkIHRvIHRyYWNrIHN0YXJ0ZWRfbGlzdCBmb3IgY29udHJvbCBlbmRwb2lu
dD8gSWYgdGhlIHJlcXVlc3QNCj4gPiBpc24ndCBwcmVwYXJlZCB5ZXQgb3IgdGhhdCB0aGUgdHJh
bnNmZXIgaGFkIGNvbXBsZXRlZCwgdGhlbiB0aGVyZSdzIG5vDQo+ID4gbmVlZCB0byBpc3N1ZSBF
bmQgVHJhbmZlciBjb21tYW5kLg0KPiA+IA0KPiA+IEJ1dCBJIGJlbGlldmUgc2VuZGluZyBFbmQg
VHJhbnNmZXIgZm9yIGluYWN0aXZlIGVuZHBvaW50IHNob3VsZCBiZSBmaW5lDQo+ID4gYWxzby4g
VGhlbiB3ZSBtYXliZSBhYmxlIHRvIGdldCBhd2F5IHdpdGhvdXQgY2hlY2tpbmcgdGhlIHN0YXJ0
ZWQgbGlzdC4NCj4gPiBJZiB5b3UncmUgcGxhbm5pbmcgdG8gZG8gdGhhdCwgcGxlYXNlIHRlc3Qg
YW5kIG5vdGUgaXQgc29tZXdoZXJlLg0KPiA+IA0KPiA+ID4gDQo+IHRoYW5rcyBmb3IgdGhlIHN1
Z2dlc3Rpb24sIHN1cmUgaSdsbCBkbyBzb21lIG1vcmUgZXhwZXJpbWVudHMgYW5kIGNvbmZpcm0N
Cj4gaXQuDQo+IA0KDQpKdXN0IGN1cmlvdXMsIGhvdyBkbyB5b3UgaGl0L3Rlc3QgdGhpcyBzY2Vu
YXJpbz8NCg0KRm9yIG90aGVyIGVuZHBvaW50IHR5cGVzLCBJIGNhbiBzZWUgcG9zc2libGUgc2Nl
bmFyaW9zIHdoZXJlIGEgZGVxdWV1ZQ0KbWF5IGJlIG5lZWRlZCwgYnV0IEkgZG9uJ3Qgc2VlIG9u
ZSBmb3IgY29udHJvbCB0cmFuc2Zlci4NCg0KVGhlIGhvc3QgY2FuIGNhbmNlbCB0aGUgY29udHJv
bCB0cmFuc2ZlciwgYW5kIHRoZSBjb250cm9sbGVyIHdpbGwgc2VlDQoic2V0dXBfcGFja2V0X3Bl
bmRpbmciIGFuZCBoYW5kbGUgYWNjb3JkaW5nbHkuIElmIHRoZXJlJ3MgYSBkaXNjb25uZWN0LA0K
dGhhdCdzIGFsc28gaGFuZGxlZCBzZXBhcmF0ZWx5IGJ5IHRoZSBjb250cm9sbGVyIGRyaXZlciBh
bHNvLiBTbywgd2hlcmUNCmRvZXMgZXAwX2RlcXVldWUgY29tZSBpbnRvIHBsYXkgaGVyZT8NCg0K
VGhhbmtzLA0KVGhpbmg=
