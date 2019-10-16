Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49AF7D9332
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 16:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405621AbfJPOAt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 10:00:49 -0400
Received: from sonic305-2.consmr.mail.bf2.yahoo.com ([74.6.133.41]:33632 "EHLO
        sonic305-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404448AbfJPOAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 10:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1571234447; bh=2WyIOtQ/U7lkSnB0LWs94pR+1/L1irVJb5iZ8RpiM7k=; h=Date:From:Reply-To:Subject:From:Subject; b=cIt7zSEPiiPfnmuWVavJnWNR3kevJOe/iOwQ1tE49+y9gEXvgDDsLubu3kEswd5qZVTrwPWT4oYGOHGisDG8PSISEdZ6u4A+baTrBj4Mck6n4XYwuxBXXxbfLn3zvKbwGpsc4ULYk15/+GUztClQ2QAP9BYVGBJC/5dv8T/J8dJwcGvwuvBkUhYAUpWjvZP49r7fy1Z19n5ZkrFLxOMpRN7EPXruUxNUjok1iA0eFfFfJuzJud5YGAlXDpXJVT2BYm9HpQNUkbfVZ6waosFCdIZfcXlzkqa3xM46+6/YiR43uzqK9tDuDiVDZTvTLoAHxnofKY58fKae/kyFB4O4uQ==
X-YMail-OSG: tK8q5f8VM1m2gOKdA.x4_vPkaoxB8nZUYXJSwg8wX.UFssKNQkFREtcWU2SgWI6
 ZMafkwghF86aIuYWyW.o9KZlZSVVHO71b3D0PrClrVaflgwVwiL4oYZb6VFhiWeC4pFme8.7xG_X
 JOtNgdRl7URaDMDyp2ZX0o8cctWbKUlWRlptOq9MAVKnH3EwoDX3PqJkYY13Dm8JBOiWo12sQVbm
 pBtMxE6frgJVGkVlPpRkK_OhdPlr_oO.ZIYpK.5pWeQ1jJRiZQtOP.C_NPInGfSNPwGUQZqjVKAa
 0CxD.ceZJ.JsvGtGTPjoyjmwes865T1Z.NbETdlXmxuJXDClfxDDlC7LO2NqoDDbVT1.QJfePE0H
 h0WggmcM1lrLXxzf.E007iO3PtwkJYhl3pWFlBFz6QUzQdUAikveaKoqzE0lLhsROBqfUC8mThtW
 XzHdA6M3H6cifSHveBKhCeKouoJivAShiDbZbHEbQ2iGz0qwSlf1A5e4po9xPFM7bHYv5WiYb.yj
 jDqIr4518kdSinuFrGCzSdfE7rCoKRZ7198dkpl5b4QleoRwRhFFXX7f5CkI_DLikbiW1ycNFeMr
 IZiAFns8QlT5ESVRVC9.9AKWfS8hqlsaYA2LmwJt3gABeJacYUKRwM7eUIcMzXs9d7QofJlk5K_k
 ipMecPxLLYD_2YqB2fmdQnw3dgu4vvWciZKrgJ5Aa_JFCqBR3HzVXsseyQl.f6gsjShLhMUNPCDH
 flAWHawh2l_xqmlec_12SXqyIV6ldmfEtRXHwKM6mYsvvB9mRUZ6qFCHgzLD0Vl2am4DZjoaD1Bn
 XkthugOBCT1.xh5_OkeDIkf.3bidenTVs97WvH72QMquZuVOYd52BfN9j.8Vq1JNd3BY3eevrGva
 xD_B5NRSlXYhi33jMp8JAmhYsrOlg8jsBPq3xlyTttsoALEUGsqpGahzXe.AY5IR52Wr7xYeirXJ
 gsXo_npbAl54PEs7pA7l9b.LUyOZzA5pfiufsUuNabsbMELJT6MAbO25vt4sQomzmHceoajgP6h8
 u26UYbetfNQSOCZE8Gts.HdwcScAZnGWqSide7YRmMcXsGNrYZgQ1DmmmIGspVntTftDgv_WDToy
 T13tAhiX58K8EDf5oZ2nzZmZ4jrqPHVaIhBndlNqJrs82DXdDJOdqrkwAwainyflQEP2GBCw0p21
 orYunFA1JtBUlVebA4oM9dvS00UIFPZfmXukjzzOH3NxjaDQwYmwQFhrta8DwqMHkzmawZIB6Dn7
 pa6GgmtGrtdaOM2tnY6B03vgkH448wkpYXqx9VTiA60h7.0f9w40G
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Wed, 16 Oct 2019 14:00:47 +0000
Date:   Wed, 16 Oct 2019 14:00:42 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh222@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1962352404.1554008.1571234442847@mail.yahoo.com>
Subject: YOUR CO-OPERATION PLEASE.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org






Dear Friend,

I am Ms Lisa Hugh work with the department of Audit and accounting manager here in the Bank,

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment and the amount is (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so we can be reaching each other .

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.


Ms Lisa Hugh
