Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD60C84BB3
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 14:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbfHGMd4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 08:33:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40748 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbfHGMd4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 08:33:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 3B12F8036C; Wed,  7 Aug 2019 14:33:40 +0200 (CEST)
Date:   Wed, 7 Aug 2019 14:33:51 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Paolo Valente <paolo.valente@linaro.org>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: slab corruption in 5.3-rc3 while inserting an usb key
Message-ID: <20190807123351.GA14012@amd>
References: <20190807101031.GA18652@amd>
 <2B3F60AA-6851-46D0-A6E0-049BD54D5256@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
In-Reply-To: <2B3F60AA-6851-46D0-A6E0-049BD54D5256@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I hope this has to do with the failure reported by Doug.  I'm
> finalizing my fix.  I'd appreciate if you could retry with my fix
> applied.

Ok, just cc me with the fix ;-).

This happened once so far, but I have other crash (when closing
chromium) that happens a bit too often, might be related.

Best regards,
									Pavel


> > Machine is thinkpad x220. BFQ related?
> >=20
> > =09
> >=20
> > [ 8224.904413] usb 2-1.1.4: Product: Intenso Twister Line
> > [ 8224.904421] usb 2-1.1.4: Manufacturer: Alcor Tech
> > [ 8224.904428] usb 2-1.1.4: SerialNumber: 12102500210755
> > [ 8224.905778] usb-storage 2-1.1.4:1.0: USB Mass Storage device
> > detected
> > [ 8224.906519] scsi host6: usb-storage 2-1.1.4:1.0
> > [ 8225.938476] scsi 6:0:0:0: Direct-Access     Intenso  Twister Line
> > 8.07 PQ: 0 ANSI: 4
> > [ 8225.941857] sd 6:0:0:0: Attached scsi generic sg2 type 0
> > [ 8225.944342] sd 6:0:0:0: [sdc] 15257600 512-byte logical blocks:
> > (7.81 GB/7.28 GiB)
> > [ 8225.945541] sd 6:0:0:0: [sdc] Write Protect is off
> > [ 8225.945551] sd 6:0:0:0: [sdc] Mode Sense: 23 00 00 00
> > [ 8225.946669] sd 6:0:0:0: [sdc] Write cache: disabled, read cache:
> > enabled, doesn't support DPO or FUA
> > [ 8225.961509]  sdc: sdc1
> > [ 8225.966286] sd 6:0:0:0: [sdc] Attached SCSI removable disk
> > [ 8226.351785] FAT-fs (sdc1): Volume was not properly unmounted. Some
> > data may be corrupt. Please run fsck.
> > [ 8685.026976] perf: interrupt took too long (3142 > 3141), lowering
> > kernel.perf_event_max_sample_rate to 63500
> > [ 8710.270064] Slab corruption (Not tainted): bfq_queue
> > start=3Dffff8880befb0cd8, len=3D512
> > [ 8710.270073] Redzone: 0x9f911029d74e35b/0x9f911029d74e35b
> > [ 8710.270081] Last user: (bfq_put_queue+0xb0/0xe0)
> > [ 8710.270085] 1f0: 18 e5 44 93 81 88 ff ff 6b 6b 6b 6b 6b 6b 6b a5
> > ..D.....kkkkkkk.
> > [ 8710.270092] Prev obj: start=3Dffff8880befb0ac0, len=3D512
> > [ 8710.270097] Redzone: 0xd84156c5635688c0/0xd84156c5635688c0
> > [ 8710.270102] Last user: (bfq_get_queue+0x13a/0x290)
> > [ 8710.270105] 000: 02 00 00 00 00 00 00 00 00 38 a6 95 81 88 ff ff
> > .........8......
> > [ 8710.270110] 010: 07 00 03 00 07 00 03 00 00 00 00 00 00 00 00 00
> > ................
> > [ 8711.077572] Slab corruption (Not tainted): bfq_queue
> > start=3Dffff8880c20b7710, len=3D512
> > [ 8711.077577] Redzone: 0x9f911029d74e35b/0x9f911029d74e35b
> > [ 8711.077584] Last user: (bfq_put_queue+0xb0/0xe0)
> > [ 8711.077586] 1f0: 6b 6b 6b 6b 6b 6b 6b 6b 00 00 00 00 00 00 00 00
> > kkkkkkkk........
> > [ 8711.077591] Prev obj: start=3Dffff8880c20b74f8, len=3D512
> > [ 8711.077593] Redzone: 0x9f911029d74e35b/0x9f911029d74e35b
> > [ 8711.077596] Last user: (bfq_put_queue+0xb0/0xe0)
> > [ 8711.077598] 000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > kkkkkkkkkkkkkkkk
> > [ 8711.077601] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > kkkkkkkkkkkkkkkk
> > [ 8711.077604] Next obj: start=3Dffff8880c20b7928, len=3D512
> > [ 8711.077606] Redzone: 0x9f911029d74e35b/0x9f911029d74e35b
> > [ 8711.077609] Last user: (bfq_put_queue+0xb0/0xe0)
> > [ 8711.077611] 000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > kkkkkkkkkkkkkkkk
> > [ 8711.077614] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
> > kkkkkkkkkkkkkkkk
> > [ 8764.014525] Slab corruption (Not tainted): bfq_queue
> > start=3Dffff888049b0c108, len=3D512
> > [ 8764.014534] Redzone: 0x9f911029d74e35b/0x9f911029d74e35b
> > [ 8764.014542] Last user: (bfq_put_queue+0xb0/0xe0)
> > [ 8764.014546] 1f0: 6b 6b 6b 6b 6b 6b 6b 6b 00 00 00 00 00 00 00 00
> > kkkkkkkk........
> > [ 8764.014553] Next obj: start=3Dffff888049b0c320, len=3D512
> > [ 8764.014558] Redzone: 0xd84156c5635688c0/0xd84156c5635688c0
> > [ 8764.014562] Last user: (bfq_get_queue+0x13a/0x290)
> > [ 8764.014566] 000: 01 00 00 00 00 00 00 00 00 50 df 96 81 88 ff ff
> > .........P......
> > [ 8764.014571] 010: 04 00 02 00 04 00 02 00 00 00 00 00 00 00 00 00
> > ................
> > [10593.478355] perf: interrupt took too long (3936 > 3927), lowering
> > kernel.perf_event_max_sample_rate to 50750
> > [10745.055650] Slab corruption (Not tainted): bfq_queue
> > start=3Dffff88818f6a9088, len=3D512
> > [10745.055660] Redzone: 0x9f911029d74e35b/0x9f911029d74e35b
> > [10745.055670] Last user: (bfq_put_queue+0xb0/0xe0)
> > [10745.055675] 1f0: a0 f6 71 d4 80 88 ff ff 6b 6b 6b 6b 6b 6b 6b a5
> > ..q.....kkkkkkk.
> > [10745.055683] Next obj: start=3Dffff88818f6a92a0, len=3D512
> > [10745.055688] Redzone: 0xd84156c5635688c0/0xd84156c5635688c0
> > [10745.055693] Last user: (bfq_get_queue+0x13a/0x290)
> > [10745.055698] 000: 01 00 00 00 00 00 00 00 00 38 a6 95 81 88 ff ff
> > .........8......
> > [10745.055704] 010: 04 00 02 00 04 00 02 00 00 00 00 00 00 00 00 00
> > ................
> > [12141.101100] usb 2-1.1.4: USB disconnect, device number 8
> > pavel@duo:/data/l/linux-olpc$


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAl1KxS8ACgkQMOfwapXb+vJ9NACYwqeTt7xgZPJPX09UhDpJpNBG
8QCfZi+YDOoVeQA9d1QPUvUqvcvQy1s=
=Kccd
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
