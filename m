Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E11E2D968C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 11:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgLNKqa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 05:46:30 -0500
Received: from mout.web.de ([212.227.17.12]:49489 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730488AbgLNKqQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Dec 2020 05:46:16 -0500
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Mon, 14 Dec 2020 05:46:15 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1607942656;
        bh=ZCDLYKqX84fBZGHqv0rz100An2gd6NC0cIMKY1QUNBc=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=hjXxd3sX+EveIHOd92L7QcSXtlTXCO3GcAA8CU0lCmJ3HWszN10K+cOPLeOnWDj61
         mbDZIEgOkbXE+aAFkAcbK1wqgAk+oaS0vYxKZJXojhN1ljwc13zdzLqz8H+g7WsToX
         2JVwOC54zm1+XvPYpi698hdK4zhhx+rmK+TVyUYY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from jupiter.fritz.box ([78.94.222.115]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgyj-1jyKBZ1HZP-00uvUP for
 <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 11:36:18 +0100
To:     linux-usb@vger.kernel.org
From:   Joachim Schwender <joachim.schwender@web.de>
Subject: kernel 5.9.14 USB scanner detection fails
Message-ID: <4028b5c8-3f4b-4266-423b-a7c9652e653d@web.de>
Date:   Mon, 14 Dec 2020 11:36:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aLUgG9SMGhXCdHEWkANiiey3TfSmPEwiTDGAd/JVllwk2Z2jXM2
 e55oGR83qyBcZPO/IIFCcN/HuS+MRBsMTP6xlD5Zl4dzZFbqc2Op2Sgj+3+aIBJSVNypv0j
 FKrhODfI9nifaTYa4yvJdSIq6cO6HEh50/tPs9rUJGdXn/KsF8xFgY0Cai84tMmMDeZ6Zsr
 9Av4S4/VjDVTd56IOr4QQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dmI/OhFOLTw=:NcOfw+Zs5CzzlAuHW37y5R
 BPyLG9R3hhlGadJK0+6HNbqflaSxyjq+HSEiQaU9GZwsN+49awqVAGIWsZuZWJeP583cpCKgr
 VcA/9hJIjd5EfpyqB3L5YrUmoiAj/32Yslp0+xxTAsExIyRw3ahnLYAvuQpPOOF9f36xyqmdS
 FHrFAtofc6VZ2Y9g2/mJDmE0zK4fuz/OitSPRQcFwHu4gghURr0BTWOUfNwKM9Ac2LUmiOdtq
 1K3aj4uhDCW0h1Z8Ms8Zh8hyN8dYs41H74x9iemCHV7yHhVcAx1CBYszqCeg+IsNtDUxX5VBU
 xdnHjPdUVbpmMEY2UWJ5T/HkRIDcgd6nXb16+ji4jn1CApaSqxIpIeQT50j7ydXuCd4u+fj/V
 gFsGxZwyMzFCJzkO7+TblYLKjGWXYH9+p7ae9escr9bRPT4J0/OXqOdOb8fqDh+sMwOmLlGJB
 FlIE9PRkI1uVfEmbG3m/o2G5jlSoHCEDCUuvZniONqDhu4U7W7u648AfljLsXErCWSNX3jJUU
 SdDe9IkGeSHd2ZccsN5PLsvTDxa//Ho+8lORz7uK1iNKtVSInSHuBK0f2dHgtYV2Fa/VyKksb
 GHoWLW8wLdksDGOK+/F50tbL2X3MKLoiv+iVzr6kTpkFBS5WeJlGnC9ESKVZzlFExJGfPcQ1r
 bohM2ZBCqZY8G50CcKR6IJdxmTg+vz3LWDCJAKC1P+2E9vSm+PN69f4DMoqLOiBxclWrHZl+W
 4DmmrNK5y6jxm/hfJEEJW43idDNcAlRQ5koxhBnOkXntsR7BadLDYG61TApLFbDLAQcLsb3h3
 SmVMmDJCMzws3Bb3WjRQKNh/ydY7jJd3Fp9+/UoTtm7DmFRGl9HR0m2wjFnZT/uW0mda9HIo6
 nJ3aGQ0zEP1/s5n0Dxgw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

lsusb lists my scanner:
Bus 001 Device 002: ID 04a9:190f Canon, Inc. CanoScan LiDE 220


kernel 4.9.14:
sane-find-scanner   or scanimage -L  does not detect the scanner.
lsusb still shows the above line.

kernel 4.9.12:
with the same .config compiled worked as expected, scanner is detected
and works.


=2D-
Joachim Schwender

